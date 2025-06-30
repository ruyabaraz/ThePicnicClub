"use strict";
Object.defineProperty(exports, "__esModule", { value: true });
exports.NetworkUtils = exports.LSJSONDataConfig = exports.lsJSONParse = exports.lsJSONStringify = exports.getPersistenceFromValue = exports.putNetworkTypeToStore = exports.getNetworkTypeFromStore = exports.putNetworkIdToStore = exports.getNetworkIdFromStore = exports.getSceneObjectHelper = exports.isSceneObject = exports.isTransform = exports.findNetworkRoot = exports.isRootObject = exports.NETWORK_TYPE_KEY = exports.NETWORK_ID_KEY = void 0;
const SyncKitLogger_1 = require("../Utils/SyncKitLogger");
const NetworkMessageWrapper_1 = require("./NetworkMessageWrapper");
const NetworkRootInfo_1 = require("./NetworkRootInfo");
const StoreEventWrapper_1 = require("./StoreEventWrapper");
exports.NETWORK_ID_KEY = "_network_id";
exports.NETWORK_TYPE_KEY = "_network_type";
const TAG = "NetworkUtils";
const log = new SyncKitLogger_1.SyncKitLogger(TAG);
/**
 * Returns `true` if the passed in `sceneObject` has a `NetworkRootInfo` attached to it.
 * @param sceneObject - The scene object to check.
 * @returns `true` if the scene object has a `NetworkRootInfo` attached, otherwise `false`.
 */
function isRootObject(sceneObject) {
    const networkedSceneObject = sceneObject;
    if (networkedSceneObject._isNetworkRoot) {
        return true;
    }
    return false;
}
exports.isRootObject = isRootObject;
/**
 * Recursively searches upwards in the hierarchy to find a `NetworkRootInfo` object.
 * @param sceneObject - The scene object to start the search from.
 * @returns The `NetworkRootInfo` object if found, otherwise `null`.
 */
function findNetworkRoot(sceneObject) {
    const networkedSceneObject = sceneObject;
    if (isRootObject(sceneObject)) {
        return networkedSceneObject._networkRoot;
    }
    if (sceneObject.hasParent()) {
        return findNetworkRoot(sceneObject.getParent());
    }
    return null;
}
exports.findNetworkRoot = findNetworkRoot;
function isTransform(target) {
    return target.isOfType("Transform");
}
exports.isTransform = isTransform;
function isSceneObject(target) {
    return target.isOfType("SceneObject");
}
exports.isSceneObject = isSceneObject;
/**
 * Gets the scene object from the target.
 * @param target - The target to get the scene object from.
 * @returns The scene object if found, otherwise `null`.
 */
function getSceneObjectHelper(target) {
    if (isNull(target)) {
        return null;
    }
    if (isSceneObject(target)) {
        return target;
    }
    if (isTransform(target)) {
        return target.getSceneObject();
    }
    if (target.getSceneObject) {
        return target.getSceneObject();
    }
    return null;
}
exports.getSceneObjectHelper = getSceneObjectHelper;
/**
 * Gets the network id from the data store.
 * @param store - The data store to get the network id from.
 * @returns The network id.
 */
function getNetworkIdFromStore(store) {
    return store.getString(exports.NETWORK_ID_KEY);
}
exports.getNetworkIdFromStore = getNetworkIdFromStore;
/**
 * Writes the id to the data store.
 * @param store - The data store to write the id to.
 * @param id - The id to write.
 */
function putNetworkIdToStore(store, id) {
    store.putString(exports.NETWORK_ID_KEY, id);
}
exports.putNetworkIdToStore = putNetworkIdToStore;
/**
 * Gets the network type from the data store.
 * @param store - The data store to get the network type from.
 * @returns The network type.
 */
function getNetworkTypeFromStore(store) {
    return store.getString(exports.NETWORK_TYPE_KEY);
}
exports.getNetworkTypeFromStore = getNetworkTypeFromStore;
/**
 * Writes the network type to the data store.
 * @param store - The data store to write the network type to.
 * @param type - The network type to write.
 */
function putNetworkTypeToStore(store, type) {
    store.putString(exports.NETWORK_TYPE_KEY, type);
}
exports.putNetworkTypeToStore = putNetworkTypeToStore;
/**
 * Helper function to convert from string, or null, to {@link RealtimeStoreCreateOptions.Persistence}.
 * @param persistence - The persistence value to convert.
 * @returns The converted persistence value.
 */
function getPersistenceFromValue(persistence) {
    if (persistence === null || persistence === undefined) {
        return RealtimeStoreCreateOptions.Persistence.Session;
    }
    if (typeof persistence === "string") {
        if (persistence in RealtimeStoreCreateOptions.Persistence) {
            persistence = RealtimeStoreCreateOptions.Persistence[persistence];
        }
        else {
            log.w("Invalid persistence type: " + persistence);
            return RealtimeStoreCreateOptions.Persistence.Session;
        }
    }
    return persistence;
}
exports.getPersistenceFromValue = getPersistenceFromValue;
/**
 * Stringifies an object to JSON.
 * @param obj - The object to stringify.
 * @returns The JSON string.
 */
function lsJSONStringify(obj) {
    return JSON.stringify(obj, lsJSONReplacer);
}
exports.lsJSONStringify = lsJSONStringify;
/**
 * Parses a JSON string.
 * @param text - The JSON string to parse.
 * @returns The parsed object.
 */
function lsJSONParse(text) {
    return JSON.parse(text, lsJSONReviver);
}
exports.lsJSONParse = lsJSONParse;
// JSON Serialization Helpers
const LS_TYPE_KEY = "___lst";
/**
 * Configuration for JSON data serialization.
 */
class LSJSONDataConfig {
    constructor(constructorFunc, props) {
        this.constructorFunc = constructorFunc;
        this.props = props;
    }
    /**
     * Gets the constructor arguments from the object.
     * @param obj - The object to get the arguments from.
     * @returns The constructor arguments.
     */
    getArgs(obj) {
        const argumentArray = new Array(this.props.length);
        for (let i = 0; i < this.props.length; i++) {
            argumentArray[i] = obj[this.props[i]];
        }
        return argumentArray;
    }
    /**
     * Constructs an object from the arguments.
     * @param args - The constructor arguments.
     * @returns The constructed object.
     */
    construct(args) {
        return new this.constructorFunc(...args);
    }
}
exports.LSJSONDataConfig = LSJSONDataConfig;
const _lsJSONConfigLookup = {
    vec2: new LSJSONDataConfig(vec2, ["x", "y"]),
    vec3: new LSJSONDataConfig(vec3, ["x", "y", "z"]),
    vec4: new LSJSONDataConfig(vec4, ["x", "y", "z", "w"]),
    quat: new LSJSONDataConfig(quat, ["w", "x", "y", "z"]),
};
/**
 * JSON replacer function for serialization.
 * @param _key - The key being replaced.
 * @param value - The value being replaced.
 * @returns The replaced value.
 */
function lsJSONReplacer(_key, value) {
    if (typeof value === "object") {
        for (const configKey in _lsJSONConfigLookup) {
            const config = _lsJSONConfigLookup[configKey];
            if (value instanceof config.constructorFunc) {
                const data = {};
                data[LS_TYPE_KEY] = configKey;
                data.a = config.getArgs(value);
                return data;
            }
        }
    }
    return value;
}
/**
 * JSON reviver function for deserialization.
 * @param _key - The key being revived.
 * @param value - The value being revived.
 * @returns The revived value.
 */
function lsJSONReviver(_key, value) {
    if (typeof value === "object") {
        const typeKey = value[LS_TYPE_KEY];
        if (typeKey !== undefined) {
            const config = _lsJSONConfigLookup[typeKey];
            if (config) {
                return config.construct(value.a);
            }
        }
    }
    return value;
}
exports.NetworkUtils = {
    NetworkRootInfo: NetworkRootInfo_1.NetworkRootInfo,
    StoreEventWrapper: StoreEventWrapper_1.StoreEventWrapper,
    NetworkMessageWrapper: NetworkMessageWrapper_1.NetworkMessageWrapper,
    isRootObject: isRootObject,
    findNetworkRoot: findNetworkRoot,
    getNetworkIdFromStore: getNetworkIdFromStore,
    putNetworkIdToStore: putNetworkIdToStore,
    getNetworkTypeFromStore: getNetworkTypeFromStore,
    putNetworkTypeToStore: putNetworkTypeToStore,
    getPersistenceFromValue: getPersistenceFromValue,
    lsJSONParse: lsJSONParse,
    lsJSONStringify: lsJSONStringify,
};
global.networkUtils = exports.NetworkUtils;
global.NETWORK_ID_KEY = exports.NETWORK_ID_KEY;
global.NETWORK_TYPE_KEY = exports.NETWORK_TYPE_KEY;
//# sourceMappingURL=NetworkUtils.js.map
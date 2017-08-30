/*******************************************************************************
 *
 *  Copyright FUJITSU LIMITED 2017
 *
 *  Creation Date: Jan 13, 2015
 *
 *******************************************************************************/
package org.oscm.json;

import com.google.gson.*;
import org.apache.commons.lang3.StringUtils;

import java.lang.reflect.Type;

/**
 * Created by BadziakP on 2017-08-29.
 */
public class CustomJsonObjectSerializer implements JsonSerializer<JsonObject> {

    @Override
    public JsonElement serialize(JsonObject jsonObject, Type type, JsonSerializationContext jsonSerializationContext) {

        for (JsonParameter jsonParameter : jsonObject.getParameters()) {
            if (jsonParameter.getOptions().isEmpty()) {
                jsonParameter.setOptions(null);
            }
        }
        if (jsonObject.getParameters().isEmpty()) {
            jsonObject.setParameters(null);
        }
        if (StringUtils.isBlank(jsonObject.getLocale())) {
            jsonObject.setLocale(null);
        }

        com.google.gson.JsonObject jObj = (com.google.gson.JsonObject)new GsonBuilder().create().toJsonTree(jsonObject);
        return jObj;
    }
}

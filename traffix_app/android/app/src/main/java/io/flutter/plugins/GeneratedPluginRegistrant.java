package io.flutter.plugins;

import androidx.annotation.Keep;
import androidx.annotation.NonNull;

import io.flutter.embedding.engine.FlutterEngine;
import io.flutter.embedding.engine.plugins.shim.ShimPluginRegistry;

/**
 * Generated file. Do not edit.
 * This file is generated by the Flutter tool based on the
 * plugins that support the Android platform.
 */
@Keep
public final class GeneratedPluginRegistrant {
  public static void registerWith(@NonNull FlutterEngine flutterEngine) {
    ShimPluginRegistry shimPluginRegistry = new ShimPluginRegistry(flutterEngine);
      io.flutter.plugins.firebase.cloudfirestore.CloudFirestorePlugin.registerWith(shimPluginRegistry.registrarFor("io.flutter.plugins.firebase.cloudfirestore.CloudFirestorePlugin"));
      io.flutter.plugins.firebase.core.FirebaseCorePlugin.registerWith(shimPluginRegistry.registrarFor("io.flutter.plugins.firebase.core.FirebaseCorePlugin"));
      io.flutter.plugins.firebase.storage.FirebaseStoragePlugin.registerWith(shimPluginRegistry.registrarFor("io.flutter.plugins.firebase.storage.FirebaseStoragePlugin"));
      vn.hunghd.flutter.plugins.imagecropper.ImageCropperPlugin.registerWith(shimPluginRegistry.registrarFor("vn.hunghd.flutter.plugins.imagecropper.ImageCropperPlugin"));
      io.flutter.plugins.imagepicker.ImagePickerPlugin.registerWith(shimPluginRegistry.registrarFor("io.flutter.plugins.imagepicker.ImagePickerPlugin"));
  }
}

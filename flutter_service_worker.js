'use strict';
const MANIFEST = 'flutter-app-manifest';
const TEMP = 'flutter-temp-cache';
const CACHE_NAME = 'flutter-app-cache';
const RESOURCES = {
  "index.html": "b5d9e386791515833c9a4dc2d07aae65",
"/": "b5d9e386791515833c9a4dc2d07aae65",
"assets/packages/font_awesome_flutter/lib/fonts/fa-solid-900.ttf": "d21f791b837673851dd14f7c132ef32e",
"assets/packages/font_awesome_flutter/lib/fonts/fa-regular-400.ttf": "bdd8d75eb9e6832ccd3117e06c51f0d3",
"assets/packages/font_awesome_flutter/lib/fonts/fa-brands-400.ttf": "3ca122272cfac33efb09d0717efde2fa",
"assets/packages/cupertino_icons/assets/CupertinoIcons.ttf": "9a62a954b81a1ad45a58b9bcea89b50b",
"assets/NOTICES": "5b03b2043d8e02ff6a5fd0d8f7f05d3e",
"assets/AssetManifest.json": "d3a277e4c6004fd4f90e45bfad34cff4",
"assets/assets/banner_2.jpeg": "dd9ab282610333cd406936d4d40d0115",
"assets/assets/preview3.jpg": "b9a813df621712b34cc865ffb3e18749",
"assets/assets/banner_4.jpeg": "5b20b781d660a2049eea9e23cbfb2e37",
"assets/assets/side_pic1.jpeg": "3a66570f96df6f18ba1f67985125c25d",
"assets/assets/under_construction.jpg": "0a753aebd2480bb177fae4292f9ccd16",
"assets/assets/vending_machine_dark.jpg": "78da452edc574f77e3bd6773f6805079",
"assets/assets/side_pic4.jpeg": "3ee47a37d7b76aea0ad163224b3c4f16",
"assets/assets/preview6.jpg": "36906b9ff1fae5bf2c022c2353aa936a",
"assets/assets/preview4.jpg": "c9a5bac2c6ce5c679fad062f3b257f6b",
"assets/assets/side_pic2.jpeg": "fda88ae1e11e70cb2992b7cc22b59691",
"assets/assets/preview5.jpg": "da2268a1284e875b9ed7e240f8768d39",
"assets/assets/side_pic5.jpeg": "6e1a4485a10f03d3fbbbefe5d8d9e12c",
"assets/assets/preview1.jpg": "e9511aec1b717f3a3cc79fad3293900d",
"assets/assets/side_pic3.jpeg": "055fe494a16bd072af5fb8839375f28b",
"assets/assets/payrange.jpg": "2e00eb50aae7532d66565b9935022a62",
"assets/assets/banner_1.jpeg": "4663caea3faf2caa5c745d7a1dbf4c51",
"assets/assets/side_pic6.jpeg": "b098501d1da2620babfcd6dd1fb8d1b8",
"assets/assets/AdobeStock_104935642.jpeg": "3ba53ded07b81d51a0caeeef2bec4e53",
"assets/assets/banner_3.jpeg": "76b479324e0f2a2e5c997d381ff37050",
"assets/assets/preview2.jpg": "4cf8b2edcdd58cc54f9bb90a8d62a5b5",
"assets/FontManifest.json": "49423f9a6412e252fd13cd387ffc158e",
"main.dart.js": "936e1e4b38f9e7a95cec54ed9e2e3247",
"version.json": "b15ca86d497f1fbe959bac7c17434f43"
};

// The application shell files that are downloaded before a service worker can
// start.
const CORE = [
  "/",
"main.dart.js",
"index.html",
"assets/NOTICES",
"assets/AssetManifest.json",
"assets/FontManifest.json"];
// During install, the TEMP cache is populated with the application shell files.
self.addEventListener("install", (event) => {
  self.skipWaiting();
  return event.waitUntil(
    caches.open(TEMP).then((cache) => {
      return cache.addAll(
        CORE.map((value) => new Request(value, {'cache': 'reload'})));
    })
  );
});

// During activate, the cache is populated with the temp files downloaded in
// install. If this service worker is upgrading from one with a saved
// MANIFEST, then use this to retain unchanged resource files.
self.addEventListener("activate", function(event) {
  return event.waitUntil(async function() {
    try {
      var contentCache = await caches.open(CACHE_NAME);
      var tempCache = await caches.open(TEMP);
      var manifestCache = await caches.open(MANIFEST);
      var manifest = await manifestCache.match('manifest');
      // When there is no prior manifest, clear the entire cache.
      if (!manifest) {
        await caches.delete(CACHE_NAME);
        contentCache = await caches.open(CACHE_NAME);
        for (var request of await tempCache.keys()) {
          var response = await tempCache.match(request);
          await contentCache.put(request, response);
        }
        await caches.delete(TEMP);
        // Save the manifest to make future upgrades efficient.
        await manifestCache.put('manifest', new Response(JSON.stringify(RESOURCES)));
        return;
      }
      var oldManifest = await manifest.json();
      var origin = self.location.origin;
      for (var request of await contentCache.keys()) {
        var key = request.url.substring(origin.length + 1);
        if (key == "") {
          key = "/";
        }
        // If a resource from the old manifest is not in the new cache, or if
        // the MD5 sum has changed, delete it. Otherwise the resource is left
        // in the cache and can be reused by the new service worker.
        if (!RESOURCES[key] || RESOURCES[key] != oldManifest[key]) {
          await contentCache.delete(request);
        }
      }
      // Populate the cache with the app shell TEMP files, potentially overwriting
      // cache files preserved above.
      for (var request of await tempCache.keys()) {
        var response = await tempCache.match(request);
        await contentCache.put(request, response);
      }
      await caches.delete(TEMP);
      // Save the manifest to make future upgrades efficient.
      await manifestCache.put('manifest', new Response(JSON.stringify(RESOURCES)));
      return;
    } catch (err) {
      // On an unhandled exception the state of the cache cannot be guaranteed.
      console.error('Failed to upgrade service worker: ' + err);
      await caches.delete(CACHE_NAME);
      await caches.delete(TEMP);
      await caches.delete(MANIFEST);
    }
  }());
});

// The fetch handler redirects requests for RESOURCE files to the service
// worker cache.
self.addEventListener("fetch", (event) => {
  if (event.request.method !== 'GET') {
    return;
  }
  var origin = self.location.origin;
  var key = event.request.url.substring(origin.length + 1);
  // Redirect URLs to the index.html
  if (key.indexOf('?v=') != -1) {
    key = key.split('?v=')[0];
  }
  if (event.request.url == origin || event.request.url.startsWith(origin + '/#') || key == '') {
    key = '/';
  }
  // If the URL is not the RESOURCE list then return to signal that the
  // browser should take over.
  if (!RESOURCES[key]) {
    return;
  }
  // If the URL is the index.html, perform an online-first request.
  if (key == '/') {
    return onlineFirst(event);
  }
  event.respondWith(caches.open(CACHE_NAME)
    .then((cache) =>  {
      return cache.match(event.request).then((response) => {
        // Either respond with the cached resource, or perform a fetch and
        // lazily populate the cache.
        return response || fetch(event.request).then((response) => {
          cache.put(event.request, response.clone());
          return response;
        });
      })
    })
  );
});

self.addEventListener('message', (event) => {
  // SkipWaiting can be used to immediately activate a waiting service worker.
  // This will also require a page refresh triggered by the main worker.
  if (event.data === 'skipWaiting') {
    self.skipWaiting();
    return;
  }
  if (event.data === 'downloadOffline') {
    downloadOffline();
    return;
  }
});

// Download offline will check the RESOURCES for all files not in the cache
// and populate them.
async function downloadOffline() {
  var resources = [];
  var contentCache = await caches.open(CACHE_NAME);
  var currentContent = {};
  for (var request of await contentCache.keys()) {
    var key = request.url.substring(origin.length + 1);
    if (key == "") {
      key = "/";
    }
    currentContent[key] = true;
  }
  for (var resourceKey of Object.keys(RESOURCES)) {
    if (!currentContent[resourceKey]) {
      resources.push(resourceKey);
    }
  }
  return contentCache.addAll(resources);
}

// Attempt to download the resource online before falling back to
// the offline cache.
function onlineFirst(event) {
  return event.respondWith(
    fetch(event.request).then((response) => {
      return caches.open(CACHE_NAME).then((cache) => {
        cache.put(event.request, response.clone());
        return response;
      });
    }).catch((error) => {
      return caches.open(CACHE_NAME).then((cache) => {
        return cache.match(event.request).then((response) => {
          if (response != null) {
            return response;
          }
          throw error;
        });
      });
    })
  );
}

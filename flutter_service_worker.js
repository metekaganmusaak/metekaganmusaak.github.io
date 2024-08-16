'use strict';
const MANIFEST = 'flutter-app-manifest';
const TEMP = 'flutter-temp-cache';
const CACHE_NAME = 'flutter-app-cache';

const RESOURCES = {"assets/AssetManifest.bin": "e7791b15d28669bcd309335cd382d624",
"assets/AssetManifest.bin.json": "148d0a27b44af58f4b12fcab6a1b8e23",
"assets/AssetManifest.json": "63d45ca7763d4f1c87e5ae01b4e520ed",
"assets/assets/documents/METE_KAGAN_MUSAAK_CV.pdf": "38c1006b7282eef72b4ccf9b7c0ded09",
"assets/assets/images/dart.png": "a675cb93b75d5f1656c920dceecdcb38",
"assets/assets/images/evraka_app_icon.png": "df0541cafea9ec33024dd7b7f1acb6db",
"assets/assets/images/evraka_ss/1.jpg": "c4525c1291f5332ee58b2a6b2ff62b7d",
"assets/assets/images/evraka_ss/10.jpg": "a8be2d1ad199159321aa3da2293f63b6",
"assets/assets/images/evraka_ss/11.jpg": "bd9a0415a47064123c5922c4aa2ec12e",
"assets/assets/images/evraka_ss/2.jpg": "870e6af2cc82cc03f83c86f0c1499dcc",
"assets/assets/images/evraka_ss/3.jpg": "7e12b6663248255510f0d1f427d81eda",
"assets/assets/images/evraka_ss/4.jpg": "b3b4b1102d7644a416fdca268994a250",
"assets/assets/images/evraka_ss/5.jpg": "1cfef920d5b728243aca9b2251ed9bec",
"assets/assets/images/evraka_ss/6.jpg": "2c24440746713f37b0d690802f1b10a7",
"assets/assets/images/evraka_ss/7.jpg": "ad8d78a1668817df0f38f68c925991f0",
"assets/assets/images/evraka_ss/8.jpg": "51b705de183024201aeec5210efb1df9",
"assets/assets/images/evraka_ss/9.jpg": "30e8cb47e37007eb383d67fb0f850fe2",
"assets/assets/images/firebase.png": "1da029b3c1a275f00a75e7bb3ab8d9db",
"assets/assets/images/flutter.png": "e02a6c427d3f2f6128219c4916cc4c6f",
"assets/assets/images/get_it_on_google_play.png": "1f12a6762bc48d9b8718238d2da2c41d",
"assets/assets/images/life_tree.png": "f4374bfa93f7c8ff6df05d8de8b0f5df",
"assets/assets/images/not_found.png": "826206110ec6970e4a40aa27cc071255",
"assets/assets/images/profile.jpeg": "6b49366ace10b9f9c95da7f250664ea6",
"assets/assets/images/profile.jpg": "299b410857976e18e52b5ce654c16a6c",
"assets/assets/images/sodoit_app_icon.png": "6d9e1013004653100536874bf4362240",
"assets/assets/images/typescript.png": "9a0683e93da9a57d3b1dd0f211f89505",
"assets/assets/images/windows11.png": "d8fb2216db29ad87666cc78b46efc00c",
"assets/assets/markdowns/evraka_privacy_policy.md": "52ac82f73ee81841dba02072d5a37afd",
"assets/assets/markdowns/evraka_terms_of_service.md": "78d58844bbf53f47fb1d60ed37c6a4c1",
"assets/assets/windows_setups/Evraka.zip": "a9c3fba205f464ff36fe273a11c30456",
"assets/FontManifest.json": "5a32d4310a6f5d9a6b651e75ba0d7372",
"assets/fonts/MaterialIcons-Regular.otf": "5189c78df0154520b38beb670b0cde50",
"assets/NOTICES": "d21ec2334a2a667cccbbd96dbdbd423c",
"assets/packages/cupertino_icons/assets/CupertinoIcons.ttf": "e986ebe42ef785b27164c36a9abc7818",
"assets/packages/font_awesome_flutter/lib/fonts/fa-brands-400.ttf": "58bceaa5961579e8580eba464e20807a",
"assets/packages/font_awesome_flutter/lib/fonts/fa-regular-400.ttf": "b5ccecc94516ddc8c07b60203a2e777c",
"assets/packages/font_awesome_flutter/lib/fonts/fa-solid-900.ttf": "4f7b8336f5bbf9d7731fd1f6f203b863",
"assets/shaders/ink_sparkle.frag": "ecc85a2e95f5e9f53123dcaf8cb9b6ce",
"canvaskit/canvaskit.js": "738255d00768497e86aa4ca510cce1e1",
"canvaskit/canvaskit.js.symbols": "74a84c23f5ada42fe063514c587968c6",
"canvaskit/canvaskit.wasm": "9251bb81ae8464c4df3b072f84aa969b",
"canvaskit/chromium/canvaskit.js": "901bb9e28fac643b7da75ecfd3339f3f",
"canvaskit/chromium/canvaskit.js.symbols": "ee7e331f7f5bbf5ec937737542112372",
"canvaskit/chromium/canvaskit.wasm": "399e2344480862e2dfa26f12fa5891d7",
"canvaskit/skwasm.js": "5d4f9263ec93efeb022bb14a3881d240",
"canvaskit/skwasm.js.symbols": "c3c05bd50bdf59da8626bbe446ce65a3",
"canvaskit/skwasm.wasm": "4051bfc27ba29bf420d17aa0c3a98bce",
"canvaskit/skwasm.worker.js": "bfb704a6c714a75da9ef320991e88b03",
"favicon.png": "69bd5134329ee51e9c12c65ff8776453",
"flutter.js": "383e55f7f3cce5be08fcf1f3881f585c",
"flutter_bootstrap.js": "563fead74d07d7ac1acbd44fb06e989b",
"icons/Icon-192.png": "ac9a721a12bbc803b44f645561ecb1e1",
"icons/Icon-512.png": "96e752610906ba2a93c65f8abe1645f1",
"icons/Icon-maskable-192.png": "c457ef57daa1d16f64b27b786ec2ea3c",
"icons/Icon-maskable-512.png": "301a7604d45b3e739efc881eb04896ea",
"icons/profile.jpg": "1ce4df5d0c522e15a47d5b5cee568ec2",
"index.html": "8209fdb79c631ebb78f74d2f2306f722",
"/": "8209fdb79c631ebb78f74d2f2306f722",
"main.dart.js": "69280b96e18cdc22b2243513bcdc89ed",
"manifest.json": "e74af8957b5899dc6da961caee768ec9",
"version.json": "009c9e65172e010890f7f65fde438006"};
// The application shell files that are downloaded before a service worker can
// start.
const CORE = ["main.dart.js",
"index.html",
"flutter_bootstrap.js",
"assets/AssetManifest.bin.json",
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
        // Claim client to enable caching on first launch
        self.clients.claim();
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
      // Claim client to enable caching on first launch
      self.clients.claim();
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
        // lazily populate the cache only if the resource was successfully fetched.
        return response || fetch(event.request).then((response) => {
          if (response && Boolean(response.ok)) {
            cache.put(event.request, response.clone());
          }
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

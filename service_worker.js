self.addEventListener("install", function (event) {
  event.waitUntil(precachePages());
});

// Offline support
self.addEventListener("fetch", (event) => {
  event.respondWith(
    checkResponse(event.request).catch(() => {
      return fetchFromCache(event.request);
    })
  );
  event.waitUntil(addToCache(event.request));
});

const precachePages = async () => {
  const cache = await caches.open("offline");
  // Pages to be cached prior to being visted
  const precachePages = [];
  return await cache.addAll(precachePages);
};

const checkResponse = (request) => {
  return new Promise((fulfill, reject) => {
    fetch(request).then((response) => {
      if (response.status !== 404) {
        fulfill(response);
      } else {
        reject();
      }
    }, reject);
  });
};

const addToCache = async (request) => {
  const cache = await caches.open("offline");
  const response = await fetch(request);
  return await cache.put(request, response);
};

const fetchFromCache = async (request) => {
  const cache = await caches.open("offline");
  const matching = await cache.match(request);
  if (!matching || matching.status === 404) {
    return cache.match("offline.html");
  }
  return matching;
};

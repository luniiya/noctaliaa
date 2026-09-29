.pragma library

function withoutLock(options) {
  if (!Array.isArray(options)) {
    return options;
  }
  const filtered = options.filter(option => option && option.action !== "lock");
  return filtered.length === options.length ? options : filtered;
}

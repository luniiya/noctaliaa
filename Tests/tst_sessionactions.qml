import QtQuick
import QtTest
import "../Helpers/SessionActions.js" as SessionActions

TestCase {
  name: "SessionActions"

  function test_withoutLock() {
    const saved = [
      { action: "lock", keybind: "1" },
      { action: "suspend", keybind: "2", command: "custom-suspend" },
      { action: "shutdown", keybind: "6" }
    ];
    const cleaned = SessionActions.withoutLock(saved);
    compare(cleaned.length, 2);
    compare(cleaned[0].action, "suspend");
    compare(cleaned[0].command, "custom-suspend");
    compare(cleaned[1].action, "shutdown");
    compare(saved.length, 3);
  }

  function test_withoutLock_keepsUnchangedList() {
    const saved = [{ action: "suspend" }];
    verify(SessionActions.withoutLock(saved) === saved);
    compare(SessionActions.withoutLock(null), null);
  }
}

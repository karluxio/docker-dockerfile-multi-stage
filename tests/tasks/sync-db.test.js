const syncDB = require("../../tasks/sync-db")

describe('testing on sync-db function', () => {
  test('should return 2 when has been called 2 times', () => {

    syncDB()
    const times = syncDB()

    expect(times).toBe(2)

  })
})
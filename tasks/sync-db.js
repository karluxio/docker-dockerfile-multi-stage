let times = 0

const syncDB = () => {
  times++
  console.log(`running a task every 2 seconds - times: ${times}!`);

  return times
}

module.exports = syncDB
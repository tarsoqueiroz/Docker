const connectToDatabase = () => {
  const dummyPromise = new Promise((resolve, reject) => {
    setTimeout(() => {
      resolve();
    }, 5000);
  });

  return dummyPromise;
};

export default connectToDatabase;

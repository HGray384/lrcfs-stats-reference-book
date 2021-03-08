//Brute for the creation of the containers and the questions because of funny errors just trying to use async await when loading h5pQuestions

function asyncCreateContainers (questionFolder, cb) {
	var questionContainer = document.createElement("div");
	questionContainer.className = "questionContainer";
	questionContainer.id = "q" + questionFolder;
	document.getElementById("questionsContainer").appendChild(questionContainer);
	console.log("Created container for: ", questionFolder);
	cb();
}

let createContainers = questionFolders.reduce((promiseChain, questionFolder) => {
	return promiseChain.then(() => new Promise((resolve) => {
	  asyncCreateContainers(questionFolder, resolve);
	}));
}, Promise.resolve());

createContainers.then(() => {
	
	console.log("All display containers created.");
	
	async function asyncLoadQuestions (questionFolder, cb) {
		await new H5PStandalone.H5P(document.getElementById("q" + questionFolder), "./questionH5Ps/" + questionFolder);
		cb();
	}

	let h5pQuestions = questionFolders.reduce((promiseChainQ, questionFolder) => {
		return promiseChainQ.then(() => new Promise((resolve) => {
		  asyncLoadQuestions(questionFolder, resolve);
		}));
	}, Promise.resolve());
	
	h5pQuestions.then(() => {
		console.log('All questions loaded.')
	})
})
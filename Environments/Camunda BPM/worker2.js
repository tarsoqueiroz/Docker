const { Client, logger } = require('camunda-external-task-client-js');

// configuration for the Client:
//  - 'baseUrl': url to the Process Engine
//  - 'logger': utility to automatically log important events
//  - 'asyncResponseTimeout': long polling timeout (then a new request will be issued)
const config = { baseUrl: 'http://10.198.4.191:8080/engine-rest', use: logger, asyncResponseTimeout: 10000 };

// create a Client instance with custom configuration
const client = new Client(config);

// susbscribe to the topic: 'salvar-usuario-banco'
client.subscribe('salvar-usuario-banco', async function({ task, taskService }) {
  // Put your business logic here

  // Get a process variable
  const username = task.variables.get('username');
  const email = task.variables.get('email');

  console.log(`Salvando o usuário ${username} com o email '${email}'...`);

  // Complete the task
  await taskService.complete(task);
});

// susbscribe to the topic: 'enviar-email'
client.subscribe('cadastrar-email', async function({ task, taskService }) {
  // Put your business logic here

  // Get a process variable
  const username = task.variables.get('username');
  const email = task.variables.get('email');
  const fullname = task.variables.get('fullname');

  console.log(`Enviando email para o usuário ${username} com o email '${email}' quem tem fullname '${fullname}'...`);

  // Complete the task
  await taskService.complete(task);
});

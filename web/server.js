const express = require('express');
const bodyParser = require('body-parser');
const uuid = require('uuid/v4');
const MongoClient = require('mongodb').MongoClient;
const url = 'mongodb+srv://mainaccess:securepassword@cop4331-large-project-l2dqk.mongodb.net/test?retryWrites=true&w=majority';

const app = express();

const client = new MongoClient(url);
client.connect();

app.use(bodyParser.json());

app.use((req, res, next) =>
{
  res.setHeader('Access-Control-Allow-Origin', '*');
  res.setHeader(
    'Access-Control-Allow-Headers',
    'Origin, X-Requested-With, Content-Type, Accept, Authorization'
  );
  res.setHeader(
    'Access-Control-Allow-Methods',
    'GET, POST, PATCH, DELETE, OPTIONS'
  );
  next();
});

app.post('/api/createpost', (req, res, next) =>
{
  const { userID, postTitle, postDescription, postDate } = req.body;

  const newPost = { UserID:userID, Title:postTitle, Description:postDescription, Date:postDate };
  var error = '';

  try
  {
    const db = client.db();
    const result = db.collection('Posts').insertOne(newPost);
  }
  catch(e)
  {
    error = e.toString();
  }

  var ret = { error: error };
  res.status(200).json(ret);
});

app.post('/api/deletepost', (req, res, next) =>
{
  const { postID } = req.body;

  try
  {
    const db = client.db();
    const result = db.collection('Posts').deleteOne({ _id:postID });
  }
  catch(e)
  {
    error = e.toString();
  }

  var ret = {error: error};
  res.status(200).json(ret);
});

app.post('/api/login', async (req, res, next) =>
{
  const { username, password } = req.body;

  const db = client.db();
  const results = await db.collection('Users').find({Username:username, Password:password}).toArray();

  var id = '';

  if( results.length > 0 )
  {
    id = results[0]._id;
  }

  var ret = { id:id, error:''};
  res.status(200).json(ret);
});

app.post('/api/signup', async (req, res, next) =>
{
	const {username, email, password } = req.body;

	const newUser = { Username:username, EmailAddress:email, Password:password };

	try
	{
		const db = client.db();
		const result = db.collection('Users').insertOne(newUser);
	}
	catch(e)
	{
    error = e.toString();
	}

	var ret = { error: error };
	res.status(200).json(ret);
});

app.post('/api/createreply', async (req, res, next) =>
{
  const { userID, postID, replyDescription, replyDate } = req.body;

  const newReply = { UserID:userID, PostID:postID, Text:replyDescription, Date:replyDate };

  try
  {
    const db = client.db();
    const result = db.collection('Replies').insertOne(newReply);
  }
  catch(e)
  {
    error = e.toString();
  }

  var ret = { error: error };
  res.status(200).json(ret);
});

app.post('/api/deletereply', async (req, res, next) =>
{
  const { replyID } = req.body;

  try
  {
    const db = client.db();
    const result = db.collection('Replies').deleteOne({ _id:replyID });
  }
  catch (e)
  {
    error = e.toString();
  }

  var ret = { error: error};
  res.status(200).json(ret);
});

app.post('/api/getallposts', async (req, res, next) =>
{
  const db = client.db();
  const results = await db.collection('Posts').find({}).toArray();

  var ret = JSON.stringify(results);

  res.status(200).json(ret);
});

app.post('/api/getallreplies', async (req, res, next) =>
{
  const { postID } = req.body;

  const db = client.db();
  const results = await db.collection('Replies').find({ PostID:postID }).toArray();

  var ret = JSON.stringify(results);

  res.status(200).json(ret);
});

app.listen(5000);

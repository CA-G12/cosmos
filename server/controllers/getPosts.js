const getPostsQuery= require('../database/queries/getPostsQuery')

const getPosts=(req,res)=>{
      getPostsQuery().then(data=> res.json(data.rows))
}

module.exports=getPosts
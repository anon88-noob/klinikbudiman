const express=require("express");
const app=express();
app.use(express.json({limit:"10mb"}));

/*
  Reference only. Connect these handlers to PostgreSQL using parameterized
  queries and real authentication before clinical deployment.
*/
app.post("/api/auth/login",(req,res)=>res.status(501).json({error:"Implement server-side authentication"}));
app.post("/api/auth/logout",(req,res)=>res.json({ok:true}));
app.get("/api/patients",(req,res)=>res.status(501).json({error:"Connect PostgreSQL"}));
app.get("/api/patients/:key",(req,res)=>res.status(501).json({error:"Connect PostgreSQL"}));
app.post("/api/visits",(req,res)=>res.status(501).json({error:"Connect PostgreSQL"}));
app.delete("/api/patients/:key",(req,res)=>res.status(501).json({error:"Connect PostgreSQL"}));
app.post("/api/import",(req,res)=>res.status(501).json({error:"Connect PostgreSQL"}));

app.listen(process.env.PORT||3000,()=>console.log("Klinik Budiman API running"));

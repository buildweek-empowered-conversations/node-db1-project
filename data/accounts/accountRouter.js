const express = require("express");
const router = express.Router();

const db = require('../dbConfig');

router.get("/", (req, res) => {
  db("accounts")
    .then(accounts => {
      res.status(200).json(accounts);
    })
    .catch(() => {
      res
        .status(500)
        .json({ message: "Could not  retrieve the list of accounts" });
    });
});

router.get("/:id", (req, res) => {
  db("accounts")
    .where({ id: req.params.id })
    .then(account => {
      res.status(200).json(account);
    })
    .catch(() => {
      res.status(500).json({ message: "Error getting the account." });
    });
});

router.post("/", (req, res) => {
  if (req.body) {
    db("accounts")
      .insert(req.body, "id")
      .then(([id]) => id)
      .then(id => {
        db("accounts")
          .where({ id })
          .first()
          .then(account => {
            res.status(201).json(account);
          });
      })
      .catch(() => {
        res.status(500).json({ message: "Error posting" });
      });
  } else {
    res.status(400).json({ message: "Provide name and budget" });
  }
});

router.put('/:id', (req,res)=> {
         db('accounts')
        .where({id: req.params.id})
        .update(req.body)
        .then(account=> {
            if(account){
                res.status(200).json({message:`${account} account was updated.`})
            }else{
                res.status(500).json({message: 'Error updating the account.'})
            }
            });
      
})


router.delete('/:id', (req,res)=> {
    db('accounts')
    .where({id: req.params.id})
    .del()
    .then(count => {
        res.status(200).json({message: `${count} account has been deleted.`})
    })
    .catch(()=>{
        res.status(500).json({message: "Error deleting the account."})
    } )
})

module.exports = router;

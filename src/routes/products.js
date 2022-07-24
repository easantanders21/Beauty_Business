const express = require("express");
const router = express.Router(); // objeto Router nos permitira manejar rutas

const mysqlConnection = require("../database");

// Get all products
router.get("/", async (req, res) => {
  const rows = await mysqlConnection.query("SELECT * FROM products");
  res.json(rows);
});

// Get a product by its ID
router.get("/:product_id", async (req, res) => {
  const { product_id } = req.params;
  const rows = await mysqlConnection.query(
    "SELECT * FROM products WHERE product_id = ?",
    [product_id]
  );
  res.json(rows[0]);
});

// Add a new product to database
router.post("/", async (req, res) => {
  const { product_id, name_product, category_id, mark_id } = req.body;

  // The query const store a call to store procedure from MySQL
  const query = `
        CALL productAddOrEdit(?,?,?,?);
    `;
  await mysqlConnection.query(query, [
    product_id,
    name_product,
    category_id,
    mark_id,
  ]);
  res.json({ Status: "Successfully Added!" });
});

// Update a product in database
router.put("/:product_id", (req, res) => {
  const { name_product, category_id, mark_id } = req.body;
  const { product_id } = req.params;
  const query = `
        CALL productAddOrEdit(?,?,?,?);
    `;
  mysqlConnection.query(
    query,
    [product_id, name_product, category_id, mark_id],
    (err, rows, fields) => {
      if (!err) {
        res.json({ Status: "Successfully Updated!" });
      } else {
        console.log(err);
      }
    }
  );
});

// Delete product from database
router.delete("/:product_id", (req, res) => {
  const { product_id } = req.params;
  const query = "DELETE FROM products WHERE product_id = ?";
  mysqlConnection.query(query, [product_id], (err, rows, fields) => {
    if (!err) {
      res.json({ Status: "Successfully Deleted!" });
    } else {
      console.log(err);
    }
  });
});

module.exports = router;

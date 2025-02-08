const mongoose = require("mongoose");

// Replace with your actual MongoDB Atlas connection string
const MONGO_URI = "mongodb+srv://vaibhav:vaibhav_database@cluster0.87yph.mongodb.net/?retryWrites=true&w=majority&appName=Cluster0";

// Define Product Schema
const productSchema = new mongoose.Schema({
  name: { type: String, required: true, trim: true },
  description: { type: String, required: true, trim: true },
  images: [{ type: String, required: true }],
  quantity: { type: Number, required: true },
  price: { type: Number, required: true },
  category: { type: String, required: true }
});

const Product = mongoose.model("Product", productSchema);

// Connect to MongoDB Atlas
mongoose
  .connect(MONGO_URI, { useNewUrlParser: true, useUnifiedTopology: true })
  .then(() => console.log("✅ Connected to MongoDB Atlas"))
  .catch((err) => console.error("❌ MongoDB Connection Error:", err));

// Dummy Data
const products = [
  { name: "Banana", price: 0.99, images: ["https://instamart-media-assets.swiggy.com/swiggy/image/upload/fl_lossy,f_auto,q_auto,h_600/7d16044af1d3c5612089e0e8e5364f29"], description: "Fresh banana", quantity: 100, category: "Fruits & Vegetables" },
  { name: "Milk", price: 2.49, images: ["https://media-assets.swiggy.com/swiggy/image/upload/fl_lossy,f_auto,q_auto,w_252,h_272/xrj8lmdwtc3ll27s9wvc"], description: "Dairy Fresh Milk", quantity: 50, category: "Dairy Products" },
  { name: "Bread", price: 1.99, images: ["https://media-assets.swiggy.com/swiggy/image/upload/fl_lossy,f_auto,q_auto,w_252,h_272/NI_CATALOG/IMAGES/CIW/2025/1/24/c6aca64b-d4c4-4a34-aa21-2e18d24298b0_93344_1.png"], description: "Whole Wheat Bread", quantity: 30, category: "Breakfast" },
  { name: "Mangoes", price: 3.99, images: ["https://instamart-media-assets.swiggy.com/swiggy/image/upload/fl_lossy,f_auto,q_auto,h_600/NI_CATALOG/IMAGES/CIW/2024/5/23/aa0ec2ac-1827-4c88-a902-8807c048b397_freshfruits_DYMY0JSXYJ_MN.png"], description: "Juicy Mangoes", quantity: 40, category: "Fruits & Vegetables" },
  { name: "Cheese", price: 4.99, images: ["https://media-assets.swiggy.com/swiggy/image/upload/fl_lossy,f_auto,q_auto,w_252,h_272/poy7dlhigla23vr927xo"], description: "Processed Cheese", quantity: 60, category: "Dairy Products" },
  { name: "Apples", price: 1.49, images: ["https://media-assets.swiggy.com/swiggy/image/upload/fl_lossy,f_auto,q_auto,w_252,h_272/53abc4b79446572e9c7a0eb090890cb6"], description: "Red Apples", quantity: 50, category: "Fruits & Vegetables" },
  { name: "Carrots", price: 0.79, images: ["https://media-assets.swiggy.com/swiggy/image/upload/fl_lossy,f_auto,q_auto,w_252,h_272/cd9136ecedec6ed4f49a568cf7be8dbc"], description: "Fresh Carrots", quantity: 50, category: "Fruits & Vegetables" },
  { name: "Yogurt", price: 3.49, images: ["https://media-assets.swiggy.com/swiggy/image/upload/fl_lossy,f_auto,q_auto,w_252,h_272/NI_CATALOG/IMAGES/CIW/2024/10/10/56f25881-5878-4145-aa43-df9580ca6086_2892.png"], description: "Healthy Yogurt", quantity: 30, category: "Dairy Products" },
  { name: "Rice", price: 2.99, images: ["https://media-assets.swiggy.com/swiggy/image/upload/fl_lossy,f_auto,q_auto,w_252,h_272/NI_CATALOG/IMAGES/CIW/2024/4/5/9ed1e1ba-4990-46c6-8de8-2abfec4d1c36_ricericeproducts_FK0ND8FKBK_MN.png"], description: "Basmati Rice", quantity: 100, category: "Groceries" },
];

// Insert Data
const insertProducts = async () => {
  try {
    await Product.insertMany(products);
    console.log("✅ Data inserted successfully!");
    mongoose.connection.close(); // Close connection
  } catch (error) {
    console.error("❌ Error inserting data:", error);
  }
};

insertProducts();

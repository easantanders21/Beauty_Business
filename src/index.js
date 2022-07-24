const express = require("express");
const morgan = require("morgan");
const exphbs = require("express-handlebars");
const path = require("path"); // use to concatenate paths

const app = express();

// SECTION SETTINGS

// using port setting by this way ensure that if you change the port or the server
// AWS, Heroku, etc brings its own port, express will use it, that's possible
// through ENV variable PORT
app.set("port", process.env.PORT || 3000);
app.set("views", path.join(__dirname, "views")); // __dirname(current file directory) + /views
app.engine(".hbs", exphbs.engine({
    defaultLayout: "main",
    layoutsDir: path.join(app.get("views"), "layouts"),
    partialsDir: path.join(app.get("views"), "partials"),
    extname: ".hbs",
    helpers: require("./lib/handlebars")
}));
app.set("view engine", ".hbs");

// SECTIONS MIDDLEWARES
// aplicaciones que procesan datos antes que servidor los reciba
app.use(morgan('dev'));
app.use(express.json()); // libreria usada para manejar archivos en formato json,
app.use(express.urlencoded({extended: false}));

// ROUTES
app.use("/products", require("./routes/products"));

// PUBLIC
app.use(express.static(path.join(__dirname, 'public')));

app.listen(app.get("port"), () =>
  console.log("Escuchando en el puerto", app.get("port"))
);

/* global use, db */
// MongoDB Playground
// To disable this template go to Settings | MongoDB | Use Default Template For Playground.
// Make sure you are connected to enable completions and to be able to run a playground.
// Use Ctrl+Space inside a snippet or a string literal to trigger completions.
// The result of the last command run in a playground is shown on the results panel.
// By default the first 20 documents will be returned with a cursor.
// Use 'console.log()' to print to the debug output.
// For more documentation on playgrounds please refer to
// https://www.mongodb.com/docs/mongodb-vscode/playgrounds/

// Select the database to use.
use('cinematop');

//Nivel1//
// Mostra els 2 primers comentaris que hi ha en la base de dades.
ej1_a = db.comments.find().projection({"text" : 1}).limit(2);

// Quants usuaris tenim registrats?
ej1_b = db.users.countDocuments()

// Quants cinemes hi ha en l'estat de Califòrnia?
ej1_c = db.theaters.countDocuments({'location.address.state':'CA'})

// Quin va ser el primer usuari/ària en registrar-se?
ej1_d = db.users.find().sort({_id:-1}).limit(1)

// Quantes pel·lícules de comèdia hi ha en la nostra base de dades?
ej1_e = db.movies.countDocuments({genres:'Comedy'})

// Mostra'm tots els documents de les pel·lícules produïdes en 1932, però que el gènere sigui drama o estiguin en francès.
ej2 = db.movies.find(
{$and: [{$or: [{genres: 'Drama'}, {languages: 'French'}]}, {year: 1932}]}
)

//Mostra'm tots els documents de pel·lícules estatunidenques que tinguin entre 5 i 9 premis que van ser produïdes entre 2012 i 2014.
ej3 = db.movies.find(
{$and: [{countries: 'USA'},
{'awards.wins': {$gte: 5, $lte:9}},
{year: {$gte: 2012, $lte: 2014}}
]}
)


// Nivel 2//
// Compte quants comentaris escriu un usuari/ària que utilitza "GAMEOFTHRON.ES" com a domini de correu electrònic.
ej1 = db.comments.countDocuments({email: {$regex: '(?i)@gameofthron.es'}})

// Quants cinemes hi ha en cada codi postal situats dins de l'estat Washington D. C. (DC)?
ej2 = db.theaters.aggregate(
  [{'$match': {'location.address.state': 'DC'}}, 
    {'$group': {'_id': '$location.address.zipcode','cantidad': {'$count': {}}}}]
  )
 



// Nivel 3//
// Troba totes les pel·lícules dirigides per John Landis amb una puntuació IMDb (Internet Movie Database) d'entre 7,5 i 8.
ej1 = db.movies.find(
{$and: [{directors: 'John Landis'}, 
{'imdb.rating': {$gte: 7.5, $lte: 8} }]}
)






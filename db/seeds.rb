# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Skill.create!([{
  name: "Ruby"
},
{
  name: "C"   
},
{
 name: "C++"
},
{
  name: "Java"   
}])


QuestionBank.create!([{
  question: "List the features of Java Programming language",
  difficulty_level: "Easy",
  tech: "Java"
},
{
  question: "What is the difference between JDK, JRE, and JVM?",
  difficulty_level: "Easy",
  tech: "Java"
},
{
  question: "What are the various access specifiers in Java?",
  difficulty_level: "Easy",
  tech: "Java"
},
{
  question: "How many types of constructors are used in Java?",
  difficulty_level: "Medium",
  tech: "Java"
},
{
  question: "What is an abstract class in C++?",
  difficulty_level: "Medium",
  tech: "C++"
},
{
  question: "What is the difference between struct and class?",
  difficulty_level: "Difficult",
  tech: "C++"
},
{
  question: "Name the four types of variables available in Ruby Class",
  difficulty_level: "Easy",
  tech: "ROR"
},
{
  question: "How can you protect Rails against Cross-Site Request Forgery?",
  difficulty_level: "Medium",
  tech: "ROR"
},
{
  question: "What is the Rails Controller?",
  difficulty_level: "Easy",
  tech: "ROR"
},
{
  question: "What command can you use to create a controller for the subject?",
  difficulty_level: "Easy",
  tech: "ROR"
}])

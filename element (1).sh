#!/bin/bash

PSQL="psql --username=freecodecamp --dbname=periodic_table -t --no-align -c"

if [[ $1 ]]
then
# if argument is a not a digit
  if [[ ! $1 =~ ^[0-9]+$ ]]
  then
    ATOMIC_NUMBER=$($PSQL "SELECT atomic_number FROM properties INNER JOIN elements USING(atomic_number) WHERE symbol = '$1' OR name = '$1'")
    # if element is not in the database
    if [[ -z $ATOMIC_NUMBER ]]
    then
      echo "I could not find that element in the database."
    fi
  else
    # if argument is a digit
    ATOMIC_NUMBER=$($PSQL "SELECT atomic_number FROM properties WHERE atomic_number = $1")
    # if element is not in the database
    if [[ -z $ATOMIC_NUMBER ]]
    then
      echo "I could not find that element in the database."
    fi
  fi
# get element name
ELEMENT_NAME=$($PSQL "SELECT name FROM elements WHERE atomic_number = $ATOMIC_NUMBER")
# get element symbol
ELEMENT_SYMBOL=$($PSQL "SELECT symbol FROM elements WHERE atomic_number = $ATOMIC_NUMBER")
# get element type
ELEMENT_TYPE=$($PSQL "SELECT type FROM properties INNER JOIN types USING(type_id) WHERE atomic_number = $ATOMIC_NUMBER")
# get element atomic mass
ATOMIC_MASS=$($PSQL "SELECT atomic_mass FROM properties WHERE atomic_number = $ATOMIC_NUMBER")
# get element melting point
MELTING_POINT=$($PSQL "SELECT melting_point_celsius FROM properties WHERE atomic_number = $ATOMIC_NUMBER")
# get element boiling point
BOILING_POINT=$($PSQL "SELECT boiling_point_celsius FROM properties WHERE atomic_number = $ATOMIC_NUMBER")
# output solution
echo "The element with atomic number $ATOMIC_NUMBER is $ELEMENT_NAME ($ELEMENT_SYMBOL). It's a $ELEMENT_TYPE, with a mass of $ATOMIC_MASS amu. $ELEMENT_NAME has a melting point of $MELTING_POINT celsius and a boiling point of $BOILING_POINT celsius." 
else
  echo "Please provide an element as an argument."
fi


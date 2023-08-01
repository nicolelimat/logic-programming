# familytree

This is a Prolog program that represents a fictional family tree across three generations. The individuals and relationships defined in this program are entirely fictional and meant for educational and entertainment purposes only.

## Table of Contents
- [Family Facts](#family-facts)
- [Family Rules](#family-rules)

## Family Facts

The program defines individuals in three generations along with their parent-child relationships:

### 1st Generation:
- `pai(edmundo, jose)`, `pai(edmundo, joao)`, `pai(edmundo, aurora)`, `pai(valdecir, pedro)`
- `mae(lurdes, jose)`, `mae(lurdes, joao)`, `mae(lurdes, aurora)`, `mae(mariane, pedro)`

### 2nd Generation:
- `pai(jose, borin)`, `pai(joao, ryan)`, `pai(joao, barbara)`, `pai(pedro, isabela)`, `pai(pedro, caroline)`
- `mae(camila, borin)`, `mae(assucena, ryan)`, `mae(assucena, barbara)`, `mae(aurora, isabela)`, `mae(aurora, caroline)`

### 3rd Generation:
- `pai(francelino, bonardi)`, `pai(francelino, vinicius)`, `pai(felipe, maria)`, `pai(felipe, giovana)`
- `mae(isabela, bonardi)`, `mae(isabela, vinicius)`, `mae(caroline, maria)`, `mae(caroline, giovana)`

## Family Rules

The program provides the following family rules:

- `avo(X, Y)`: Defines a grandparent relationship, where `X` is the grandparent of `Y`.
- `neto(X, Y)`: Defines a grandchild relationship, where `X` is the grandchild of `Y`.
- `bisavo(X, Y)`: Defines a great-grandparent relationship, where `X` is the great-grandparent of `Y`.
- `irmao(X, Y)`: Defines a sibling relationship, where `X` and `Y` are siblings (share the same parents).
- `primo(X, Y)`: Defines a cousin relationship, where `X` and `Y` are cousins (their parents are siblings).
- `casal(X, Y)`: Defines a married couple, where `X` and `Y` are married and have at least one child together.
- `tio(X, Y)`: Defines an uncle/aunt relationship, where `X` is the uncle/aunt of `Y`.
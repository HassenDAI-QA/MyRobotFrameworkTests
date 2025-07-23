*** Settings ***
Documentation     Teste le processus d'ajout d'un produit au panier sur Saucedemo
Library           SeleniumLibrary
Resource          ../resources/shopping_keywords.robot
Suite Setup       Open Browser And Go To Login Page
Suite Teardown    Close Browser

*** Test Cases ***
Test Ajouter Un Produit Au Panier
    Login With Valid Credentials
    Add Product To Cart
    Go To Cart
    Verify Product Is In Cart
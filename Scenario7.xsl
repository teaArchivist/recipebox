<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <xsl:output method="text" encoding="UTF-8" indent="yes" />

    <!--We are retrieving every recipebox, with their recipes, and the ingredient list for each recipe-->

    <!--TEMPLATE 1
    We match the template to the root node. We use xsl:text to create the containers, inspired by a model found at
    https://xml2json.duttke.de/
    For every recipebox that contains at least one recipe, we apply a template to it.-->
    <xsl:template match="/">
        <xsl:text>{"recipeboxes":[</xsl:text>
            <xsl:apply-templates select="//recipebox[recipes/recipe]" />
        <xsl:text>]}</xsl:text>
    </xsl:template>

    <!--TEMPLATE 2
    We match the template to the recipebox element seen above.
    The position function allows us to add a comma before every new element except the first one
    We retrieve the value of the attribute id for "recipebox".
    For every recipe element, we apply a template to it.-->
    <xsl:template match="recipebox">
        <xsl:if test="position() != 1">,</xsl:if>
        <xsl:text>{"recipeBox":{"id":"</xsl:text>
            <xsl:value-of select="@id" />
        <xsl:text>","recipes":[</xsl:text>
                <xsl:apply-templates select="recipes/recipe" />
        <xsl:text>]}}</xsl:text>
    </xsl:template>

    <!--TEMPLATE 3
    We match the template to the recipe element seen above.
    The position function allows us to add a comma before every new element except the first one
    We retrieve the name of the recipe by matching the idref to the recipe id in an xpath.
    We retrieve the name of the ingredient by the idref matching to the ingredient id in an xpath.-->
    <xsl:template match="recipe">
        <xsl:if test="position() != 1">,</xsl:if>
        <xsl:text>{"name":"</xsl:text>
            <xsl:value-of select="//recipes/recipe[@id=current()/@idref]/title" />
        <xsl:text>","ingredients":[</xsl:text>
            <xsl:apply-templates select="//recipes/recipe[@id=current()/@idref]/information/ingredients/ingredient" />
        <xsl:text>]}</xsl:text>
    </xsl:template>

    <!--TEMPLATE 4
    We match the template to the ingredient element seen above.
    The position function allows us to add a comma before every new element except the first one
    We retrieve the value of the container amount, and the value of the idref in the container unit.
    We retrieve the name of the ingredient by matching the idref and the ingredient id.
    To make the format more homogenuous, we put the name in all lowercase.-->
    <xsl:template match="ingredient">
        <xsl:if test="position() != 1">,</xsl:if>
        <xsl:text>{"amount":"</xsl:text>
            <xsl:value-of select="amount" />
        <xsl:text>","unit":"</xsl:text>
            <xsl:value-of select="unit/@idref" />
        <xsl:text>","name":"</xsl:text>
            <xsl:value-of select="translate(//ingredients/ingredient[@id=current()/@idref]/name, 'ABCDEFGHIJKLMNOPQRSTUVWXYZ', 'abcdefghijklmnopqrstuvwxyz')" />
        <xsl:text>"}</xsl:text>
    </xsl:template>
</xsl:stylesheet>

<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <xsl:output method="xml" encoding="UTF-8" indent="yes" />

    <!--TEMPLATE 1
    We match the template to the root node and create a container "recipeboxes"/
    We then apply a template to each element recipebox (XML source file) that has at least one "recipe" element-->
    <xsl:template match="/">
        <recipeboxes>
            <xsl:apply-templates select="//recipebox[recipes/recipe]" />
        </recipeboxes>
    </xsl:template>

    <!--TEMPLATE 2
    We match the template to the "recipebox" element seen above. For each one, we create a container "recipebox".
    We retrieve the attribute "id" and insert it inside the created "id" container.
    We create a container recipes in which we will then apply a template to each element "recipe" found under "recipebox" (/recipebox/recipes/recipe)-->
    <xsl:template match="recipebox">
        <recipebox>
            <id><xsl:value-of select="@id" /></id>
            <recipes>
                <xsl:apply-templates select="recipes/recipe" />
            </recipes>
        </recipebox>
    </xsl:template>

    <!--TEMPLATE 3
    We match the template to the "recipe" element seen above. For each one, we create a container "recipe".
    We retrieve the name of the recipe by using the "idref" that references the unique recipe "id" in the recipes section via xpath. We insert it in the created "name" container.
    We create an "ingredients" container in which we will then apply a template to each element "ingredient" found in the referenced recipe.-->
    <xsl:template match="recipe">
        <recipe>
            <name><xsl:value-of select="//recipes/recipe[@id=current()/@idref]/title" /></name>
            <ingredients>
                <xsl:apply-templates select="//recipes/recipe[@id=current()/@idref]/information/ingredients/ingredient" />
            </ingredients>
        </recipe>
    </xsl:template>

    <!--TEMPLATE 4
    We match the template to the "ingredient" element seen above. For each one, we create a container "ingredient".
    We retrieve the value of the container "amount" in the source XML file and insert it in a created "amount" container.
    We retrieve the idref attribute of the container "unit" in the source XML file and insert it in a created "unit" container.
    We retrieve the name of the ingredient via the idref that references it. We then put it in lowercase to homogenize the formatting.
    Note: XML 1.0 does not have a lowercase or uppercase() function. The standard seems to be the translate() function, verbose as it is.-->
    <xsl:template match="ingredient">
        <ingredient>
            <amount><xsl:value-of select="amount" /></amount>
            <unit><xsl:value-of select="unit/@idref" /></unit>
            <name><xsl:value-of select="translate(//ingredients/ingredient[@id=current()/@idref]/name, 'ABCDEFGHIJKLMNOPQRSTUVWXYZ', 'abcdefghijklmnopqrstuvwxyz')" /></name>
        </ingredient>
    </xsl:template>
</xsl:stylesheet>

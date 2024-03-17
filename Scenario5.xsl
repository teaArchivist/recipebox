<?xml version="1.0" encoding="UTF-8" ?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <xsl:output method="html" doctype-public="XSLT-compat" omit-xml-declaration="yes" encoding="UTF-8" indent="yes" />

<!--This scenario is addressing a ranking of the recipes. 
The solution required defining a key, variables, and implementing them in aggregations: 
    1 .Search for all recipes that have at least one comment 
    2. Sort them based on the average rating calculated from their comments 
    3. Define variables to store the recipe ID, comments, totalRatings, and averageRating 
These variables are then used to calculate outputs in the table for position (recipe rank), title, and its averageRating.-->
    
<!--Create a key to link comments in recipe to comment-->
    <xsl:key name="recipe-comments" match="comment" use="@recipe"/>

    <!--Match to the root element -->
    <xsl:template match="/">
        <recipeboxes>
            <table border="1">
                <tr>
                    <th>Rank</th>
                    <th>Title</th>
                    <th>Average Rating</th>
                </tr>
                <!--Select all recipes that have a comment-->
                <xsl:for-each select="//recipes/recipe[.//comment]">
                    <!--Sort them by their average rating-->
                    <xsl:sort select="sum(key('recipe-comments', @id)/rating) div count(key('recipe-comments', @id))" data-type="number" order="descending"/>
                    <!--Define variables for recipe ID, comments, total rating, and average rating-->
                    <xsl:variable name="recipeId" select="@id"/>
                    <xsl:variable name="comments" select="//user_feedback/comment[recipe/@idref = $recipeId]"/>
                    <xsl:variable name="totalRatings" select="sum($comments/rating)"/>
                    <xsl:variable name="averageRating" select="format-number($totalRatings div count($comments), '0.00')"/>
                    <!--In the table, output the recipe rank, its name, and average rating-->
                    <tr>
                        <td><xsl:number value="position()"/></td>
                        <td><xsl:value-of select="title"/></td>
                        <td><xsl:value-of select="$averageRating"/></td>
                    </tr>
                </xsl:for-each>
            </table>
        </recipeboxes>
    </xsl:template>

</xsl:stylesheet>

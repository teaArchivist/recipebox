<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

  <!-- Match the root element -->
  <xsl:template match="/">
    <!-- Apply templates to each recipe box -->
    <xsl:apply-templates select="//recipebox"/>
  </xsl:template>

  <!-- Match recipe box elements -->
  <xsl:template match="recipebox">
    <!-- Output recipe box information -->
    <div class="recipe-box">
      <h2>Recipe Box ID: <xsl:value-of select="@id"/></h2>
      <p>Tags: 
        <xsl:for-each select="tags/tag">
          <xsl:value-of select="@idref"/>
          <xsl:if test="position() &lt; last()">, </xsl:if>
        </xsl:for-each>
      </p>
      <p>Price: <xsl:value-of select="concat(price, ' ', price/@currency)"/></p>

      <!-- Retrieve recipes -->
      <xsl:for-each select="recipe">
        <!-- Retrieve recipe details using key() function -->
        <xsl:variable name="recipeDetails" select="key('RecipeKey', @idref)"/>

        <!-- Output recipe details -->
        <div class="recipe">
          <h3>Title: <xsl:value-of select="$recipeDetails/title"/></h3>
          <p>Ingredients:</p>
          <ul>
            <!-- Retrieve and output ingredients -->
            <xsl:for-each select="$recipeDetails/information/ingredients/ingredient">
              <li>
                <xsl:value-of select="concat(amount, ' ', unit/@idref, ' of ', @idref)"/>
              </li>
            </xsl:for-each>
          </ul>
        </div>
      </xsl:for-each>
    </div>
  </xsl:template>

</xsl:stylesheet>

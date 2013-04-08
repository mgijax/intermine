<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib tagdir="/WEB-INF/tags" prefix="im"%>


<!-- dataCategories -->

<html:xhtml/>

<div class="body">
<im:boxarea title="About MouseMine" stylename="plainbox"><p><fmt:message key="dataCategories.intro"/></p></im:boxarea>


<table cellpadding="0" cellspacing="0" border="0" class="dbsources">
  <tr>
    <th>Data Category</th>
    <th>Data</th>
    <th>Source</th>
  </tr>
  
  <!-- ******************************************************* -->
  <tr>
    <td rowspan="2" class="leftcol">
    <h2><p>Genome</p></h2>
    </td>
    <td>
    Mouse genome feature catalog. All mouse features from MGI, including nomenclature, 
    synonyms, ids, genome coordinates and cross-references (external database IDs).
    </td>
    <td> 
    <a href="http://www.informatics.jax.org/" target="_new">MGI</a>
    </td>
  </tr>

  <tr>
    <td> 
    Human genes, including symbols, names, ids, and genome coordinates.
    </td>
    <td> 
    <a href="http://www.ncbi.nlm.nih.gov/sites/entrez?db=gene" target="_new">EntrezGene</a> (via MGI)
    </td>
  </tr>


  
  <!-- ******************************************************* -->
  <tr>
    <td rowspan="2"  class="leftcol">
      <p><h2>Function</h2></p>
    </td>
    <td> 
      Mouse GO annotations. High quality associations of  mouse genes (and other features) to biological processes, molecular functions, and cellular localizations.
    </td>
    <td> 
      <a href="http://www.informatics.jax.org/" target="_new">MGI</a>
      <br>
      <a href="http://www.informatics.jax.org/function.shtml" target="_new">GO@MGI</a>
    </td>
  </tr>
  <tr>
    <td> 
    Gene Ontology (GO). 
    </td>
    <td> 
    <a href="http://geneontology.org" target="_new">Gene Ontology</a> project.
    </td>
  </tr>



  <!-- ******************************************************* -->

  <tr>
    <td rowspan="3"  class="leftcol">
    <p><h2>Phenotype</h2></p></td>
    <td> 
    The MGI catalog of mouse alleles, including targeted, engineered, induced, and spontaneous mutants. 
    </td>
    <td rowspan="3"> 
      <a href="http://www.informatics.jax.org/" target="_new">MGI</a>
    </td>
  </tr>

  <tr>
    <td> 
    Phenotype (MP) terms annotated to specific mouse genotypes. 
    </td>
  </tr>

  <tr>
    <td> 
    Mammalian Phenotype (MP) ontology
    </td>
  </tr>


  <!-- ******************************************************* -->
  <tr>
    <td rowspan="3"  class="leftcol">
    	<p><h2>Disease</h2></p></td>
    <td> Mouse disease model annotations, i.e., associations of human diseases to specific mouse models (genotypes).</td>
    <td> <a href="http://www.informatics.jax.org/" target="_new">MGI</a></td>
  </tr>
  
  <tr>
    <td>
    Human disease gene annotations, i.e., associations of human genes with specific diseases.
    </td>
    <td>
    <a href="http://www.omim.org/" target="_new">OMIM</a> (via MGI)
    </td>
  </tr>

  <tr>
    <td>MEDIC disease ontology. MEDIC is a merging of OMIM disease ids onto the MeSH disease ontology. OMIM disease annotations from MGI are converted into the corresponding MEDIC annotations in MouseMine. </td>
    <td>
    <a href="http://ctdbase.org/" target="_new">Comparative Toxicogenomics Database</a> (CTD)
    </td>
  </tr>


  <!-- ******************************************************* -->
  <tr>
    <td rowspan="2"  class="leftcol">
    <p><h2>Homology</h2></p></td>
    <td> Mouse-Human Orthologies</td>
    <td> 
    <a href="http://www.ncbi.nlm.nih.gov/homologene/" target="_new">Homologene</a> and <a href="http://www.pantherdb.org/">Panther</a>
  </tr>

  <tr>
    <td> 
    Mouse-Human Synteny Blocks.
    Computed/extrapolated from ortholog pairs and their coordinates.
    (Usage note: InterMine does not yet provide any facilities for <i>mapping</i> (interpolating) coordinates using synteny blocks. Implementation of such a service is on the "to do" list.)
    </td>
    <td> 
    <a href="http://www.informatics.jax.org/" target="_new">MGI</a>
    </td>
  </tr>

  <!-- ******************************************************* -->
  <tr>
    <td class="leftcol">
    <p><h2>Literature</h2></p></td>
    <td> 
    All publications from MGI.
    </td>
    <td> 
    <a href="http://www.informatics.jax.org/" target="_new">MGI</a>
    </td>
  </tr>


</table>


<div class="body">
</div>

</div>
<!-- /dataCategories -->

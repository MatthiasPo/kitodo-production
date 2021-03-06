<%--
 *
 * (c) Kitodo. Key to digital objects e. V. <contact@kitodo.org>
 *
 * This file is part of the Kitodo project.
 *
 * It is licensed under GNU General Public License version 3 or later.
 *
 * For the full copyright and license information, please read the
 * GPL3-License.txt file that was distributed with this source code.
 *
--%>

<%@ taglib uri="http://java.sun.com/jsf/html" prefix="h"%>
<%@ taglib uri="http://sourceforge.net/projects/jsf-comp/easysi" prefix="si"%>
<%@ taglib uri="http://myfaces.apache.org/tomahawk" prefix="x"%>

<h:panelGrid id="myFilterGrid" width="100%" columnClasses="standardTable_ColumnRight" rowClasses="standardTable_Row" columns="1">
	<h:panelGroup id="myFilter">
		<h:outputText value="#{msgs.selectFilter}: " />
		<%-- Filter Liste --%>
		<x:selectOneMenu forceId="true" id="select" style="width:18%;" value="#{Form.filter}" onclick="setFilter();">
			<si:selectItems id="pcid11" value="#{Form.user.filters}" var="item" itemLabel="#{item}" itemValue="#{item}" />
		</x:selectOneMenu>

		<%--Filter zur User-Liste hinzufuegen --%>
		<h:commandLink id="newFilterubid11" action="#{Form.addFilterToUser}" title="#{msgs.addFilter}" style="margin-left:5px">
			<h:graphicImage id="newFilterubid12" alt="Filter" value="/newpages/images/buttons/save1.gif" />
		</h:commandLink>

		<%-- remove filter from list --%>
		<h:commandLink id="removeFilterubid11" action="#{Form.removeFilterFromUser}" title="#{msgs.removeFilter}" style="margin-left:5px">
			<h:graphicImage id="removeFilterubid12" alt="Filter" value="/newpages/images/buttons/waste1_20px.gif" />
		</h:commandLink>
	</h:panelGroup>
</h:panelGrid>
<h:panelGrid id="aslsid2" width="100%" columnClasses="standardTable_Column,standardTable_ColumnRight" rowClasses="standardTable_Row"
	columns="2">
	<h:outputText id="aslsid3" value="#{msgs.treffer}: #{Form.page.totalResults}" rendered="#{showHits}" />
	<h:outputText id="aslsid3_alt" value="" rendered="#{!showHits}" />

	<h:panelGroup id="aslsid4">
		
		

		<h:outputText id="aslsid7" value="#{msgs.filter}: " />

		<x:inputText style="width:20%" forceId="true" id="filterfield" value="#{Form.filter}"
			onkeypress="return submitEnter('FilterAlle',event)" />
		<x:commandButton type="submit" id="FilterAlle" forceId="true" style="display:none" action="#{Form.FilterAlleStart}" />

		<h:commandLink id="aslsid9" action="#{Form.FilterAlleStart}" title="#{msgs.filterAnwenden}" style="margin-left:5px">
			<h:graphicImage id="aslsid10" alt="reload" value="/newpages/images/buttons/reload.gif" />
		</h:commandLink>

		<h:outputLink id="aslsid11" target="_blank" value="https://github.com/kitodo/kitodo-production/wiki/Suche-und-Filtern">
			<h:graphicImage id="aslsid12" alt="help" title="#{msgs.hilfeZumFilter}" value="/newpages/images/buttons/help.png" style="margin-left:5px" />
		</h:outputLink>
		

	</h:panelGroup>

</h:panelGrid>
<script type="text/javascript"><!--
function setFilter() {
	var myFilter = document.getElementById('select').value;
	document.getElementById('filterfield').value = myFilter;
}
-->
</script>
<%-- 
<h:panelGrid id="myFilterGrid" width="100%" columnClasses="standardTable_ColumnRight" rowClasses="standardTable_Row_bottom" columns="1">
	<h:panelGroup id="myFilter">
		<h:outputText value="#{msgs.selectFilter}" />
	
		<x:selectOneMenu forceId="true" id="select" style="width:15%;height:20px" value="#{Form.user.filter}" onclick="setFilter();">
			<si:selectItems id="pcid11" value="#{Form.user.filters}" var="item" itemLabel="#{item.value}" itemValue="#{item}" />
		</x:selectOneMenu>

		<h:commandLink id="newFilterubid11" action="#{Form.user.addFilter}" title="#{msgs.addFilter}" style="margin-left:5px">
			<h:graphicImage id="newFilterubid12" alt="Filter" value="/images/buttons/reload.gif" />
		</h:commandLink>

		<h:commandLink id="removeFilterubid11" action="#{Form.user.removeFilter}" title="#{msgs.removeFilter}" style="margin-left:5px">
			<h:graphicImage id="removeFilterubid12" alt="Filter" value="/images/buttons/reload.gif" />
		</h:commandLink>
	</h:panelGroup>
</h:panelGrid>
--%>

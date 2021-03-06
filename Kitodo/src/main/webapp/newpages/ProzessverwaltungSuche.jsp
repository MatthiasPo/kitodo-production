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

<%@ page session="false" contentType="text/html;charset=utf-8"%>
<%@ taglib uri="http://java.sun.com/jsf/core" prefix="f"%>
<%@ taglib uri="http://java.sun.com/jsf/html" prefix="h"%>
<%@ taglib uri="http://jsftutorials.net/htmLib" prefix="htm"%>
<%@ taglib uri="http://myfaces.apache.org/tomahawk" prefix="x"%>
<%@ taglib uri="http://sourceforge.net/projects/jsf-comp/easysi" prefix="si"%>

<%-- ######################################## 

								Suchmaske für Prozesse

	#########################################--%>

<html>
<f:view locale="#{SpracheForm.locale}">
	<%@include file="inc/head.jsp"%>
	<body>

		<htm:table cellspacing="5" cellpadding="0" styleClass="layoutTable" align="center">
			<%@include file="inc/tbl_Kopf.jsp"%>
			<htm:tr>
				<%@include file="inc/tbl_Navigation.jsp"%>
				<htm:td valign="top" styleClass="layoutInhalt">

					<%-- ++++++++++++++++     Inhalt      ++++++++++++++++ --%>
					<h:form id="searchform" onkeypress="ifEnterClick(event, 'searchform:absenden');">
						<%-- Breadcrumb --%>
						<h:panelGrid width="100%" columns="1" styleClass="layoutInhaltKopf">
							<h:panelGroup>
								<h:commandLink value="#{msgs.startseite}" action="newMain" id="mainlink" />
								<f:verbatim> &#8250;&#8250; </f:verbatim>
								<h:outputText value="#{msgs.prozessverwaltung}" />
							</h:panelGroup>
						</h:panelGrid>

						<htm:table border="0" align="center" width="100%" cellpadding="15">
							<htm:tr>
								<htm:td>

									<%-- Überschrift --%>
									<htm:h3>
										<h:outputText value="#{msgs.nachEinemBandSuchen}" />
									</htm:h3>

									<%-- globale Warn- und Fehlermeldungen --%>
									<h:messages globalOnly="true" errorClass="text_red" infoClass="text_blue" showDetail="true" showSummary="true" tooltip="true" />

									<%-- ===================== Eingabe der Suchparameter ====================== --%>
									<htm:table cellpadding="3" cellspacing="0" width="100%" styleClass="eingabeBoxen">

										<htm:tr>
											<htm:td styleClass="eingabeBoxen_row1" colspan="2">
												<h:outputText value="#{msgs.suche}" />
											</htm:td>
										</htm:tr>

										<htm:tr>
											<htm:td styleClass="eingabeBoxen_row2" colspan="2">
												<h:panelGrid id="extended" columns="2" rendered="#{ProzessverwaltungForm.initialize}">

													<%-- process title --%>
													<h:outputText value="#{msgs.title}: " />
													<h:panelGroup>
														<h:selectOneMenu value="#{SearchForm.processOperand}" style="width:115px; margin-right:3px">
															<f:selectItems value="#{SearchForm.operands}" />
														</h:selectOneMenu>
														<h:inputText value="#{SearchForm.processTitle}" style="width:570px" />

													</h:panelGroup>

													<%--projects --%>
													<h:outputText value="#{msgs.projects}: " />
													<h:panelGroup>
														<h:selectOneMenu value="#{SearchForm.projectOperand}" style="width:115px; margin-right:3px">
															<f:selectItems value="#{SearchForm.operands}" />
														</h:selectOneMenu>

														<h:selectOneMenu value="#{SearchForm.project}" style="width:570px">
															<si:selectItems id="pcid11" value="#{SearchForm.projects}" var="proj" itemLabel="#{proj}" itemValue="#{proj}" />
														</h:selectOneMenu>
													</h:panelGroup>

													<%-- process property --%>
													<h:outputText value="#{msgs.processProperties}: " />
													<h:panelGroup>
														<h:selectOneMenu value="#{SearchForm.processPropertyOperand}" style="width:115px; margin-right:3px">
															<f:selectItems value="#{SearchForm.operands}" />
														</h:selectOneMenu>
														<h:panelGroup>
															<h:selectOneMenu value="#{SearchForm.processPropertyTitle}" style="width:175px; margin-right:3px">
																<si:selectItems value="#{SearchForm.processPropertyTitles}" var="proc" itemLabel="#{proc}" itemValue="#{proc}" />
															</h:selectOneMenu>
															<h:inputText value="#{SearchForm.processPropertyValue}" style="width:394px" />
														</h:panelGroup>
													</h:panelGroup>

													<%-- masterpiece property --%>
													<h:outputText value="#{msgs.masterpieceProperties}: " />
													<h:panelGroup>
														<h:selectOneMenu value="#{SearchForm.masterpiecePropertyOperand}" style="width:115px; margin-right:3px">
															<f:selectItems value="#{SearchForm.operands}" />
														</h:selectOneMenu>
														<h:panelGroup>
															<h:selectOneMenu value="#{SearchForm.masterpiecePropertyTitle}" style="width:175px; margin-right:3px">
																<si:selectItems value="#{SearchForm.masterpiecePropertyTitles}" var="work" itemLabel="#{work}" itemValue="#{work}" />
															</h:selectOneMenu>
															<h:inputText value="#{SearchForm.masterpiecePropertyValue}" style="width:394px" />
														</h:panelGroup>
													</h:panelGroup>
													<%-- template property --%>
													<h:outputText value="#{msgs.templateProperties}: " />
													<h:panelGroup>
														<h:selectOneMenu value="#{SearchForm.templatePropertyOperand}" style="width:115px; margin-right:3px">
															<f:selectItems value="#{SearchForm.operands}" />
														</h:selectOneMenu>
														<h:panelGroup>
															<h:selectOneMenu value="#{SearchForm.templatePropertyTitle}" style="width:175px; margin-right:3px">
																<si:selectItems value="#{SearchForm.templatePropertyTitles}" var="temp" itemLabel="#{temp}" itemValue="#{temp}" />
															</h:selectOneMenu>
															<h:inputText value="#{SearchForm.templatePropertyValue}" style="width:394px" />
														</h:panelGroup>
													</h:panelGroup>
													<%--steps --%>
													<h:outputText value="#{msgs.step}: " />
													<h:panelGroup>
														<h:selectOneMenu value="#{SearchForm.stepOperand}" style="width:115px; margin-right:3px">
															<f:selectItems value="#{SearchForm.operands}" />
														</h:selectOneMenu>
														<h:panelGroup>
															<h:selectOneMenu value="#{SearchForm.status}" style="width:175px; margin-right:3px">
																<si:selectItems value="#{SearchForm.stepstatus}" var="stepstatus" itemLabel="#{stepstatus.title}"
																	itemValue="#{stepstatus.searchString}" />
															</h:selectOneMenu>
															<h:selectOneMenu value="#{SearchForm.stepname}" style="width:394px">
																<si:selectItems value="#{SearchForm.stepTitles}" var="stepTitles" itemLabel="#{stepTitles}" itemValue="#{stepTitles}" />
															</h:selectOneMenu>
														</h:panelGroup>
													</h:panelGroup>
													<%-- user --%>
													<h:outputText value="#{msgs.stepDoneByUser}: " rendered="#{HelperForm.userStepDoneSearchEnabled}"/>
													<h:panelGroup rendered="#{HelperForm.userStepDoneSearchEnabled}">
														<h:selectOneMenu value="#{SearchForm.stepdoneuser}">
															<si:selectItems value="#{SearchForm.user}"
																var="user" itemLabel="#{user.nachVorname}" itemValue="#{user.login}" />
														</h:selectOneMenu>
														<h:selectOneMenu value="#{SearchForm.stepdonetitle}">
														<si:selectItems value="#{SearchForm.stepTitles}"
															var="stepTitles" itemLabel="#{stepTitles}" itemValue="#{stepTitles}" />
														</h:selectOneMenu>
													</h:panelGroup>

													<%-- process id --%>
													<h:outputText value="#{msgs.id}: " />
													<h:inputText value="#{SearchForm.idin}" style="width:690px" />

													<h:outputText value="#{msgs.showArchivedProjects}:" rendered="#{(LoginForm.maximaleBerechtigung == 1)}" />
													<h:selectBooleanCheckbox value="#{ProzessverwaltungForm.showArchivedProjects}" rendered="#{(LoginForm.maximaleBerechtigung == 1)}" />

													<h:outputText value="#{msgs.showClosedProcesses}:" />
													<h:selectBooleanCheckbox value="#{ProzessverwaltungForm.showClosedProcesses}" />

												</h:panelGrid>


											</htm:td>
										</htm:tr>
										<htm:tr>
											<htm:td styleClass="eingabeBoxen_row3" align="left">
												<h:commandButton value="#{msgs.clear}" action="ProzessverwaltungSuche" immediate="true">
												</h:commandButton>
											</htm:td>

											<htm:td styleClass="eingabeBoxen_row3" align="right">
												<h:commandButton id="absenden" action="#{SearchForm.filter}" title="#{msgs.filterAnwenden}" value="#{msgs.filterAnwenden}">
												</h:commandButton>
											</htm:td>
										</htm:tr>
									</htm:table>

									<%-- ===================== // Eingabe der Suchparameter ====================== --%>

								</htm:td>
							</htm:tr>
						</htm:table>
					</h:form>
					<%-- ++++++++++++++++    // Inhalt      ++++++++++++++++ --%>

				</htm:td>
			</htm:tr>
			<%@include file="inc/tbl_Fuss.jsp"%>
		</htm:table>

	</body>
</f:view>

</html>




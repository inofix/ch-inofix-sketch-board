package ch.inofix.sketchboard.portlet;

import javax.portlet.Portlet;

import org.osgi.service.component.annotations.Component;

import com.liferay.portal.kernel.portlet.bridges.mvc.MVCPortlet;

import ch.inofix.sketchboard.constants.SketchBoardPortletKeys;

@Component(
	    immediate = true,
	    property = {
	            "com.liferay.portlet.display-category=category.hidden",
	            "com.liferay.portlet.scopeable=true",
	            "javax.portlet.display-name=SketchBoards",
	            "javax.portlet.expiration-cache=0",
	            "javax.portlet.init-param.portlet-title-based-navigation=true",
	            "javax.portlet.init-param.template-path=/",
	            "javax.portlet.init-param.view-template=/adminportlet/view.jsp",
	            "javax.portlet.name=" + SketchBoardPortletKeys.SKETCH_BOARD_ADMIN,
	            "javax.portlet.resource-bundle=content.Language",
	            "javax.portlet.security-role-ref=administrator",
	            "javax.portlet.supports.mime-type=text/html",
	            "com.liferay.portlet.add-default-resource=true"
	    },
	    service = Portlet.class
	)
public class SketchBoardAdminPortlet extends MVCPortlet {

	
}

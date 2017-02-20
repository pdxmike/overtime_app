class StaticController < ApplicationController
  def homepage
  	if admin_types.include?(current_user.type)
    	@pending_approvals = Post.submitted
    	@recent_audit_items = AuditLog.last(12)
    else
    	@employee_pending_confirmations = current_user.audit_logs
    end
  end
end

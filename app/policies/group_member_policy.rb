class GroupMemberPolicy < BasePolicy
  def rules
    return unless @user

    target_user = @subject.user
    group = @subject.group

    return if group.last_owner?(target_user)

    can_manage = Ability.allowed?(@user, :admin_group_member, group)

    if can_manage
      can! :update_group_member
      can! :destroy_group_member
    elsif @user == target_user
      can! :destroy_group_member
    end

    additional_rules!
  end

  def additional_rules!
    # This is meant to be overriden in EE
  end
end

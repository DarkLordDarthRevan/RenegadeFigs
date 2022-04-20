ActiveAdmin.register User do

  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  #
  permit_params :email, :encrypted_password, :reset_password_token, :reset_password_sent_at, :remember_created_at, :address, :province

  form do |f|
    f.semantic_errors
    f.inputs
    f.inputs do
      f.input :province, as: :select, collection: Province.all.pluck(:name)
    end
    f.actions
  end

  #
  # or
  #
  # permit_params do
  #   permitted = [:email, :encrypted_password, :reset_password_token, :reset_password_sent_at, :remember_created_at, :address, :province]
  #   permitted << :other if params[:action] == 'create' && current_user.admin?
  #   permitted
  # end

end

class AddUserIdToShmuserattribute < ActiveRecord::Migration[5.0]
  def change
    add_column :shmuserattributes, :user_id, :integer
    add_column :shmshmealattributes, :shmeal_id, :integer
    add_column :shmshmealattributes, :menuitem_id, :integer
    add_column :shmmenuitemstatuses, :menuitem_id, :integer
    add_column :shmcooks, :user_id, :integer
    add_column :shmcookstatuses, :shmcook_id, :integer
    add_column :shmorders, :shmcook_id, :integer
    add_column :shmorders, :user_id, :integer
    add_column :shmorders, :shmeal_id, :integer
    add_column :shmorders, :shmconversation_id, :integer
    add_column :menuitems, :user_id, :integer
    add_column :shmconversations, :user_id, :integer
    add_column :shmconversations, :shmcook_id, :integer
    add_column :shmaddresses, :user_id, :integer
    add_column :shmcustomerpmtmethods, :user_id, :integer
    add_column :shmeals, :menuitem_id, :integer
    add_column :shmfundings, :user_id, :integer
    add_column :shmorderfeedbacks, :shmorder_id, :integer
    add_column :shmpaymentmethodstatuses, :shmcustomerpmtmethod_id, :integer
    add_column :shmrequestattributes, :shmorder_id, :integer
    add_column :shmrequeststatuses, :shmorder_id, :integer
    add_column :shmuserstatuses, :user_id, :integer
    add_column :shmuserstatuses, :shmcook_id, :integer
  end
end

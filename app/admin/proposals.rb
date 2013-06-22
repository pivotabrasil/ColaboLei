# -*- coding: utf-8 -*-
ActiveAdmin.register Proposal do
  menu parent: I18n.t('app.active_admin.content'), priority: 2
  #actions :all, except: [:destroy, :new]

  filter :title
  filter :body

  index do
    column :id
    column :title
    column :user
    default_actions
  end

end

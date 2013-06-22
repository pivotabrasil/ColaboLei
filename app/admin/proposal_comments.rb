# -*- coding: utf-8 -*-
ActiveAdmin.register ProposalComment do
  menu parent: I18n.t('app.active_admin.content'), priority: 3
  #actions :all, except: [:destroy, :new]

  filter :body

  index do
    column :id
    column :body
    column :user
    column :proposal
    default_actions
  end

end

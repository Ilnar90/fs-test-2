# encoding: UTF-8
module EventsHelper
  def event_actions_cancel_link
    link_opts = { class: :alternate }
    link_opts[:data] = { dismiss: :modal } if request.xhr?

    link_to t('event.actions.cancel'), events_path, link_opts
  end

  def link_to_destroy_event(event)
    link_opts = { method: :delete, class: :destroy, title: t('event.actions.destroy') }
    link_opts[:remote] = request.xhr?

    confirm = t(event.recurring? ? 'event.confirm.destroy.recurring' : 'event.confirm.destroy.one_time')
    link_opts[:data] = { confirm: confirm }

    link_to '', event_path(event), link_opts
  end
end

module ApplicationHelper

  def page_title
    if active_site
      active_site["page_title"]
    else
      "HTML First"
    end
  end

  def page_description
    "Principles to make building web software easier, faster and more inclusive."
  end

  def cache_buster 
    if Rails.env.production?
      ""
    else
      "?stamp=#{DateTime.now.to_s}"
    end
  end

  def disable_left_menu 
    @disable_left_menu ||= false
  end

  def current_url_with(params)
    url_for(request.query_parameters.merge(params))
  end

  def current_params_with(params)
    request.query_parameters.merge(params)
  end

  def controller_active?

  end

  def request_from_iframe?
    request.referer.present? && request.referer != request.url
  end

  def browsing_kind?(kind="")
    params[:kind] ||= ""
    kinds = params[:kind].split(",")
    if kinds.include?(kind)
      true 
    else
      false
    end
  end

  def use_bare_layout?
    @use_bare_layout ||= false
  end

  def not_browsing_kinds(kinds=[])

  end

  def active_site 
    if is_local?
      sites.select { |site| site["local"] == request.host }.first
    else
      sites.select { |site| site["domain"] == request.host }.first
    end
  end

  def non_active_sites
    if is_local?
      sites.select { |site| site["local"] != request.host }
    else
      sites.select { |site| site["domain"] != request.host }
    end
  end



  def htmx_body_attributes
    disable = request.headers["Disable-Body-Htmx"]
    return "" if disable == "true"
    return "hx-boost='true' hx-target='#main-content' hx-select='#main-content'".html_safe
  end

  def sites 
    [
      {
        "domain" => "html-first.com",
        "local" => "html-first.localhost",
        "page_title" => "HTML First",
        "logo_path" => "/images/html-first.svg",
        "show_header" => false
      },
      {
        "domain" => "h1rails.com",
        "local" => "h1rails.localhost",
        "page_title" => "H1 Rails",
        "logo_path" => "/images/h1rails.svg",
        "show_header" => true
      },
      {
        "domain" => "base-styles.com",
        "local" => "base-styles.localhost",
        "page_title" => "Base Styles",
        "logo_path" => "/images/base-styles.svg",
        "show_header" => true
      },
      {
        "domain" => "tailwind-lite.com",
        "local" => "tailwind-lite.localhost",
        "page_title" => "Tailwind Lite",
        "logo_path" => "/images/tailwind-lite.svg",
        "show_header" => true
      },
      {
        "domain" => "mini-js.com",
        "local" => "mini-js.localhost",
        "page_title" => "Mini JS",
        "logo_path" => "/images/mini-js.svg",
        "show_header" => true
      }
    ]
  end

  def render_smarkdown(content)
    Kramdown::Document.new(content).to_html.html_safe
  end

  def protocol
    if is_local?
      "http://"
    else
      "https://"
    end
  end

  def is_local?
    # url contains localhost
    true if request.url.include?("localhost")
  end 

end

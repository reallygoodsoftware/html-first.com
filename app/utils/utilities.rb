module Utilities
   
  def self.markdown_file_to_html(filename)
    content = File.read(filename)
    markdown = Redcarpet::Markdown.new(
      Redcarpet::Render::HTML.new(
        hard_wrap: true,
        link_attributes: { target: '_blank' },
        fenced_code_blocks: true,
      ),
      autolink: true, 
      space_after_headers: true,
      fenced_code_blocks: true,
      tables: true 
    )
    markdown.render(content)
  end

  def self.markdown_file_to_html_kramdown(filename)
    content = File.read(filename)
    render_markdown(content)
  end

  def self.render_markdown(markdown_text)
    Kramdown::Document.new(markdown_text).to_html
  end

  def self.markdown_to_html(content)
    markdown = Redcarpet::Markdown.new(
      Redcarpet::Render::HTML.new(
        hard_wrap: true,
        link_attributes: { target: '_blank' },
        fenced_code_blocks: true,
      ),
      autolink: true, 
      space_after_headers: true,
      fenced_code_blocks: true,
      tables: true 
    )
    markdown.render(content)
  end

  def self.tag_metadata(tag="")
    hash = Utilities.library_list
    if hash[tag].nil?
      return hash["undefined"]
    else
      return hash[tag]
    end
  end

  def self.markdown_menu(menu_file,active_file,active_folder)
    content = markdown_file_to_html(menu_file)
    content = rewrite_menu_links(content, active_file, active_folder)
    content
  end

  def self.rewrite_menu_links(html_content, current_file, current_folder)
    doc = Nokogiri::HTML(html_content)
    
    # Rewrite links
    doc.css('a').each do |link|
      href  = link['href'].sub(/^\//, '')
      parts = href.split("/")

      if parts.length > 1 
        folder = parts[0]
        file = parts[1]
      else
        folder = ""
        file = parts[0]
      end

      link.remove_attribute('target')
      # Check if the link is the current file and add 'active' class
      if file == current_file
        existing_class = link['class']
        link['class'] = existing_class ? "#{existing_class} active" : "active"
      end

      if folder.present? && (folder == current_folder)
        existing_class = link['class']
        link['class'] = existing_class ? "#{existing_class} active" : "active"
      end
    end
    doc.to_html
  end

  def self.library_list 
    {
      "undefined" => {
        "tag_css_classes" => "bg-gray-100 text-gray-800",
        "tag_description" => "",
      },
      "tailwind" => {
        "type" => "css",
        "tag_css_classes" => "bg-sky-400 text-white",
        "tag_description" => "Tailwind CSS is a utility-first CSS framework for rapidly building custom user interfaces.",
      },
      "hyperscript" => {
        "type" => "js",
        "tag_css_classes" => "bg-sky-800 text-white",
        "tag_description" => "Hyperscript is a high performance, lightweight, front-end framework for adding interactivity to html.",
      },
      "tonic.css" => {
        "type" => "css",
        "tag_css_classes" => "bg-blue-500 text-white",
        "tag_description" => "Hyperscript is a high performance, lightweight, front-end framework for adding interactivity to html.",
      },
      "htmx" => {
        "tag_css_classes" => "bg-gray-900 text-white",
        "tag_description" => "HTMX lets you easily send ajax requests using html attributes.",
      },
      "minijs" => {
        "type" => "js",
        "tag_css_classes" => "bg-indigo-700 text-white",
        "tag_description" => "Mini Js is a new library from tonic designed to be extremely easy to understand and use."
      },
      "vanilla" => {
        "type" => "js",
        "tag_css_classes" => "bg-indigo-700 text-white",
        "tag_description" => "Vanilla"
      }
    } 
  end

  def self.js_library_list
    Utilities.library_list.select{|k,v| v["type"] == "js"}
  end

  def self.code_snippet_types
    {
      :dropdown => {
        :name => "Dropdown"
      },
      :modal => { 
        :name => "Modal"
      },
      :toast => {
        :name => "Toast"
      },
      :accordion => {
        :name => "Accordion"
      }
    }
  end

  def self.get_snippet_files(properties={})

    views_dir = Rails.root.join('app', 'views', 'examples')

    # Array to hold the names of files that match the criteria
    matching_files = []

    # Iterate over each file in the directory
    Dir.glob("#{views_dir}/*").each do |file_path|
      # Read the contents of the file
      content = File.read(file_path)

      # Use FrontMatterParser to parse the frontmatter
      begin
        # Use FrontMatterParser to parse the frontmatter from the file
        parsed = FrontMatterParser::Parser.parse_file(file_path)
      rescue FrontMatterParser::SyntaxError
        # Handle files that don't have valid frontmatter
        next
      end
      
      # Check if the file's frontmatter matches all the given properties
      matches_all_properties = properties.all? do |key, value|
        parsed.front_matter[key.to_s]  == value
      end
      matching_files << File.basename(file_path) if matches_all_properties
    
    end

    matching_files

  end

end
module ApplicationHelper
  def full_title title
    title.empty? ? t("social-image") : title + " | " + t("social-image")
  end

  Settings.objs.each do |obj|
    Settings.attrs.each do |attr|
      define_method("#{attr}_#{obj}") do |object|
        object.send(attr).present? ? object.send(attr) : "#{attr}_#{obj}.jpg"
      end
    end
  end
end

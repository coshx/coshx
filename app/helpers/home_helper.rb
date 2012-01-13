module HomeHelper

  def class_for_service(service)
    if service.description.length > 400
      "long-stretch-container"
    else
      "short-stretch-container"
    end
  end

end

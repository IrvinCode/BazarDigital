require 'test_helper'

class ProductsControllerTest < ActionDispatch::IntegrationTest
  test 'render a list of products' do
    get products_path

    assert_response :success
    assert_select '.product', 2
  end

  test 'render a detailed product page' do
    get product_path(products(:onePlus))

    assert_response :success
    assert_select '.title', 'OnePlus 7T'
    assert_select '.description', 'Detalle: Solo con detalles en la parte de atrás. Comprado en 2022.'
    assert_select '.price', 'Precio: $120'
  end
end
require "test_helper"

class ProductsControllerTest < ActionDispatch::IntegrationTest
  test "render a list of products" do
    get products_path

    assert_response :success
    assert_select ".product", 2
  end

  test "render a detailed product page" do
    get product_path(products(:onePlus))

    assert_response :success
    assert_select ".title", "OnePlus 7T"
    assert_select ".description", "Detalle: Solo con detalles en la parte de atr\u00E1s. Comprado en 2022."
    assert_select ".price", "Precio: $120"
  end

  test "render a new product form" do
    get new_product_path

    assert_response :success
    assert_select "form"
  end

  test "allow to create a new product" do
    post products_path, params: {
      product: {
        title: "Nintendo 64",
        description: "Le faltan los cables",
        price: 55
      }
    }

    assert_redirected_to products_path
  end

  test "does not allow to create a new product with empty fields" do
    post products_path, params: {
      product: {
        title: "",
        description: "Poco uso",
        price: 35
      }
    }

    assert_response :unprocessable_entity
  end
end

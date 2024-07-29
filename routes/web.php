<?php

use Illuminate\Foundation\Application;
use Illuminate\Support\Facades\Route;
use Inertia\Inertia;
use App\Models\Company;

use App\Http\Controllers\Products\CreateProductController;
use App\Http\Controllers\Products\UpdateProductController;
use App\Http\Controllers\Products\ListProductController;

use App\Http\Controllers\Suppliers\CreateSupplierController;
use App\Http\Controllers\Suppliers\UpdateSupplierController;
use App\Http\Controllers\Suppliers\ShowSupplierController;

use App\Http\Controllers\Customers\CreateCustomerController;
use App\Http\Controllers\Customers\UpdateCustomerController;
use App\Http\Controllers\Customers\ShowCustomerController;

use App\Http\Controllers\Employees\CreateEmployeeController;
use App\Http\Controllers\Employees\UpdateEmployeeController;
use App\Http\Controllers\Employees\ShowEmployeeController;

use App\Http\Controllers\Partners\CreatePartnerController;
use App\Http\Controllers\Partners\UpdatePartnerController;
use App\Http\Controllers\Partners\ShowPartnerController;

use App\http\Controllers\Company\UpdateCompanyController;

use App\Http\Controllers\Products\ProductClassification\UpdateCategoryController;
use App\Http\Controllers\Products\ProductClassification\UpdateSubcategoryController;
use App\Http\Controllers\Products\ProductClassification\UpdateGroupController;
use App\Http\Controllers\Products\ProductClassification\UpdateSubgroupController;
use App\Http\Controllers\Products\ProductClassification\UpdateBrandController;
use App\Http\Controllers\Products\ProductClassification\UpdateColorController;
use App\Http\Controllers\Products\ProductClassification\UpdateCollectionController;
use App\Http\Controllers\Products\ProductClassification\UpdateSizeController;


use App\Http\Controllers\Products\ProductClassification\CreateCategoryController;
use App\Http\Controllers\Products\ProductClassification\CreateSubcategoryController;
use App\Http\Controllers\Products\ProductClassification\CreateGroupController;
use App\Http\Controllers\Products\ProductClassification\CreateSubgroupController;
use App\Http\Controllers\Products\ProductClassification\CreateColorController;
use App\Http\Controllers\Products\ProductClassification\CreateCollectionController;
use App\Http\Controllers\Products\ProductClassification\CreateBrandController;
use App\Http\Controllers\Products\ProductClassification\CreateSizeController;



use App\Http\Controllers\Products\ProductClassification\ShowCategoryController;
use App\Http\Controllers\Products\ProductClassification\ShowSubcategoryController;
use App\Http\Controllers\Products\ProductClassification\ShowGroupController;
use App\Http\Controllers\Products\ProductClassification\ShowSubgroupController;
use App\Http\Controllers\Products\ProductClassification\ShowCollectionController;
use App\Http\Controllers\Products\ProductClassification\ShowBrandController;
use App\Http\Controllers\Products\ProductClassification\ShowColorController;
use App\Http\Controllers\Products\ProductClassification\ShowSizeController;

use App\Http\Controllers\Website\EcommerceController;

use App\Http\Controllers\Website\ContactController;
use App\Http\Controllers\Company\ShowCompanyController;

use App\Http\Controllers\Site\CreateBannerController;
use App\Http\Controllers\Site\ShowBannerController;
use App\Http\Controllers\Site\UpdateBannerController;
use App\Http\Controllers\Site\ProductLaunchController;
use App\Http\Controllers\Site\ShowSitePartnerController;
use App\Http\Controllers\Movements\NfeImportController;
use App\Http\Controllers\Movements\CreateNfeEntradaController;
use App\Http\Controllers\Movements\ShowNfeEntradaController;
use App\Http\Controllers\Movements\UpdateNfeEntradaController;




# Route::get('/navbar', [EcommerceController::class, 'navbar'])->name('navbar');
# Route::post('/api/contact', [ContactController::class, 'submitContactForm']);
# Route::get('/map', [EcommerceController::class, 'showMap'])->name('map.show');
# Route::get('/', [EcommerceController::class, 'index'])->name('home');
# Route::get('/products', [EcommerceController::class, 'products'])->name('products');
# Route::get('/balancas', [EcommerceController::class, 'balancas'])->name('balancas');
# Route::get('/impressoras', [EcommerceController::class, 'impressoras'])->name('impressoras');
# Route::get('/servicos', [EcommerceController::class, 'servicos'])->name('servicos');
# Route::get('/acessoriosInsumos', [EcommerceController::class, 'acessoriosInsumos'])->name('acessoriosInsumos');

# Route::prefix('website')->group(function () {
#     Route::get('/subcategory/{category_id}', [EcommerceController::class, 'showSubcategories'])->name('subcategorias');
# });

# Route::get('/website/groups/{subcategory_id}', [EcommerceController::class, 'showGroups'])->name('grupos');
# Route::get('/website/products/{group_id}', [EcommerceController::class, 'showGroupProducts'])->name('websiteProducts');





Route::get('/', function () {
    return Inertia::render('Welcome', [
        'canLogin' => Route::has('login'),
        'canRegister' => Route::has('register'),
        'laravelVersion' => Application::VERSION,
        'phpVersion' => PHP_VERSION,
    ]);
});





Route::middleware([
    'auth:sanctum',
    config('jetstream.auth_session'),
    'verified',
])->group(function () {
    Route::get('/dashboard', function () {
        $company = Company::findOrFail(1);     

        return Inertia::render('Ecommerce/Dashboard/Show', [
            'company' => $company,
        ]);
    })->name('dashboard');

    Route::get('/nfe-entrada', [CreateNfeEntradaController::class, 'create'])->name('nfe-entrada.create');
    Route::post('/nfe-entrada/store', [CreateNfeEntradaController::class, 'store'])->name('nfe-entrada.store'); 
    Route::post('/nfe-entrada/import', [CreateNfeEntradaController::class, 'import'])->name('nfe-entrada.import');
    Route::get('/nfe-entradas', [ShowNfeEntradaController::class, 'show'])->name('nfe-entradas.show');
    Route::get('/nfe-entrada/{id}/edit', [UpdateNfeEntradaController::class, 'edit'])->name('nfe-entrada.edit');
    Route::put('/nfe-entrada/{id}', [UpdateNfeEntradaController::class, 'update'])->name('nfe-entrada.update');



    Route::get('/products/launch', [ProductLaunchController::class, 'index'])->name('launch.show');
    Route::get('sitePartner/show', [ShowSitePartnerController::class, 'showPartner'])->name('sitePartner.show');


    Route::post('/product/create', [CreateProductController::class, 'store'])->name('product.store');
    Route::get('/product', [CreateProductController::class, 'create'])->name('product.create');
    Route::get('/products', [ListProductController::class, 'show'])->name('products.show');
    Route::post('/products/generate-description', [CreateProductController::class, 'generateDescription']);

    Route::get('/product/{id}/edit', [UpdateProductController::class, 'edit'])->name('product.edit');
    Route::put('/product/{id}', [UpdateProductController::class, 'update'])->name('product.update');
    Route::put('/product/{id}/image', [UpdateProductController::class, 'updateImage'])->name('product.updateImage');
    Route::put('/product/{id}/image_hover', [UpdateProductController::class, 'updateImageHover'])->name('product.updateImageHover');
    Route::put('/product/{id}/images', [UpdateProductController::class, 'updateImages'])->name('product.updateImages');
    Route::delete('products/delete-image/{id}', [UpdateProductController::class, 'deleteImage'])->name('product.deleteImage');

    Route::post('/supplier/create', [CreateSupplierController::class, 'store'])->name('supplier.store');
    Route::get('/supplier', [CreateSupplierController::class, 'create'])->name('supplier.create');
    Route::get('/suppliers', [ShowSupplierController::class, 'show'])->name('suppliers.show');
    Route::get('/supplier/{id}/edit', [UpdateSupplierController::class, 'edit'])->name('supplier.edit');
    Route::put('/supplier/{id}', [UpdateSupplierController::class, 'update'])->name('supplier.update');
    Route::put('/supplier/{id}/image', [UpdateSupplierController::class, 'updateImage'])->name('supplier.updateImage');


    Route::get('/company/{id}/edit', [UpdateCompanyController::class, 'edit'])->name('company.edit');
    Route::put('/company/{id}', [UpdateCompanyController::class, 'update'])->name('company.update');
    Route::put('/company/{id}/favicon', [UpdateCompanyController::class, 'updateImageFavicon'])->name('company.updateImageFavicon');
    Route::put('/company/{id}/logo_light', [UpdateCompanyController::class, 'updateImageLogoLight'])->name('company.updateImageLogoLight');
    Route::put('/company/{id}/logo_dark', [UpdateCompanyController::class, 'updateImageLogoDark'])->name('company.updateImageLogoDark');
    Route::put('/company/{id}/image_about', [UpdateCompanyController::class, 'updateImageAbout'])->name('company.updateImageAbout');
    Route::put('/company/{id}/image_about_right', [UpdateCompanyController::class, 'updateImageAboutRight'])->name('company.updateImageAboutRight');
    Route::put('/company/{id}/image_footer', [UpdateCompanyController::class, 'updateImageFooter'])->name('company.updateImageFooter');
    Route::put('/company/{id}/image_footer_botton', [UpdateCompanyController::class, 'updateImageFooterBotton'])->name('company.updateImageFooterBotton');


    Route::post('/customer/create', [CreateCustomerController::class, 'store'])->name('customer.store');
    Route::get('/customer', [CreateCustomerController::class, 'create'])->name('customer.create');
    Route::get('/customers', [ShowCustomerController::class, 'show'])->name('customers.show');
    Route::get('/customer/{id}/edit', [UpdateCustomerController::class, 'edit'])->name('customer.edit');
    Route::put('/customer/{id}', [UpdateCustomerController::class, 'update'])->name('customer.update');
    Route::put('/customer/{id}/image', [UpdateCustomerController::class, 'updateImage'])->name('customer.updateImage');


    Route::post('/employee/create', [CreateEmployeeController::class, 'store'])->name('employee.store');
    Route::get('/employee', [CreateEmployeeController::class, 'create'])->name('employee.create');
    Route::get('/employees', [ShowEmployeeController::class, 'show'])->name('employees.show');
    Route::get('/employee/{id}/edit', [UpdateEmployeeController::class, 'edit'])->name('employee.edit');
    Route::put('/employee/{id}', [UpdateEmployeeController::class, 'update'])->name('employee.update');
    Route::put('/employee/{id}/image', [UpdateEmployeeController::class, 'updateImage'])->name('employee.updateImage');


    Route::post('/partner/create', [CreatePartnerController::class, 'store'])->name('partner.store');
    Route::get('/partner', [CreatePartnerController::class, 'create'])->name('partner.create');
    Route::get('/partners', [ShowPartnerController::class, 'show'])->name('partners.show');
    Route::get('/partner/{id}/edit', [UpdatePartnerController::class, 'edit'])->name('partner.edit');
    Route::put('/partner/{id}', [UpdatePartnerController::class, 'update'])->name('partner.update');
    Route::put('/partner/{id}/favicon', [UpdatePartnerController::class, 'updateImageFavicon'])->name('partner.updateImageFavicon');
    Route::put('/partner/{id}/logo_light', [UpdatePartnerController::class, 'updateImageLogoLight'])->name('partner.updateImageLogoLight');
    Route::put('/partner/{id}/logo_dark', [UpdatePartnerController::class, 'updateImageLogoDark'])->name('partner.updateImageLogoDark');


    Route::get('/category/create', [CreateCategoryController::class, 'create'])->name('category.create');
    Route::post('/category/store', [CreateCategoryController::class, 'store'])->name('category.store');
    Route::get('/categories', [ShowCategoryController::class, 'show'])->name('categories.show');
    Route::get('/category/{id}/edit', [UpdateCategoryController::class, 'edit'])->name('category.edit');
    Route::put('/category/{id}', [UpdateCategoryController::class, 'update'])->name('category.update');
    Route::put('/category/{id}/image', [UpdateCategoryController::class, 'updateImage'])->name('category.updateImage');

    Route::get('/subcategory/create', [CreateSubcategoryController::class, 'create'])->name('subcategory.create');
    Route::post('/subcategory/store', [CreateSubcategoryController::class, 'store'])->name('subcategory.store');
    Route::get('/subcategories', [ShowSubcategoryController::class, 'show'])->name('subcategories.show');
    Route::get('/subcategory/{id}/edit', [UpdateSubcategoryController::class, 'edit'])->name('subcategory.edit');
    Route::put('/subcategory/{id}', [UpdateSubcategoryController::class, 'update'])->name('subcategory.update');
    Route::put('/subcategory/{id}/image', [UpdateSubcategoryController::class, 'updateImage'])->name('subcategory.updateImage');

    Route::get('/group/create', [CreateGroupController::class, 'create'])->name('group.create');
    Route::post('/group/store', [CreateGroupController::class, 'store'])->name('group.store');
    Route::get('/groups', [ShowGroupController::class, 'show'])->name('groups.show');
    Route::get('/group/{id}/edit', [UpdateGroupController::class, 'edit'])->name('group.edit');
    Route::put('/group/{id}', [UpdateGroupController::class, 'update'])->name('group.update');
    Route::put('/group/{id}/image', [UpdateGroupController::class, 'updateImage'])->name('group.updateImage');

    Route::get('/subgroup/create', [CreateSubgroupController::class, 'create'])->name('subgroup.create');
    Route::post('/subgroup/store', [CreateSubgroupController::class, 'store'])->name('subgroup.store');
    Route::get('/subgroups', [ShowSubgroupController::class, 'show'])->name('subgroups.show');
    Route::get('/subgroup/{id}/edit', [UpdateSubgroupController::class, 'edit'])->name('subgroup.edit');
    Route::put('/subgroup/{id}', [UpdateSubgroupController::class, 'update'])->name('subgroup.update');
    Route::put('/subgroup/{id}/image', [UpdateSubgroupController::class, 'updateImage'])->name('subgroup.updateImage');

    Route::get('/collection/create', [CreateCollectionController::class, 'create'])->name('collection.create');
    Route::post('/collection/store', [CreateCollectionController::class, 'store'])->name('collection.store');
    Route::get('/collections', [ShowCollectionController::class, 'show'])->name('collections.show');
    Route::get('/collection/{id}/edit', [UpdateCollectionController::class, 'edit'])->name('collection.edit');
    Route::put('/collection/{id}', [UpdateCollectionController::class, 'update'])->name('collection.update');
    Route::put('/collection/{id}/image', [UpdateCollectionController::class, 'updateImage'])->name('collection.updateImage');

    Route::get('/color/create', [CreateColorController::class, 'create'])->name('color.create');
    Route::post('/color/store', [CreateColorController::class, 'store'])->name('color.store');
    Route::put('/color/{id}', [UpdateColorController::class, 'update'])->name('color.update');
    Route::get('/color/{id}/edit', [UpdateColorController::class, 'edit'])->name('color.edit');
    Route::put('/color/{id}/image', [UpdateColorController::class, 'updateImage'])->name('color.updateImage');
    Route::get('/colors', [ShowColorController::class, 'show'])->name('colors.show');

    Route::get('/brand/create', [CreateBrandController::class, 'create'])->name('brand.create');
    Route::post('/brand/store', [CreateBrandController::class, 'store'])->name('brand.store');
    Route::get('/brands', [ShowBrandController::class, 'show'])->name('brands.show');
    Route::get('/brand/{id}/edit', [UpdateBrandController::class, 'edit'])->name('brand.edit');
    Route::put('/brand/{id}', [UpdateBrandController::class, 'update'])->name('brand.update');
    Route::put('/brand/{id}/image', [UpdateBrandController::class, 'updateImage'])->name('brand.updateImage');

    Route::get('/size/create', [CreateSizeController::class, 'create'])->name('size.create');
    Route::post('/size/store', [CreateSizeController::class, 'store'])->name('size.store');
    Route::get('/sizes', [ShowSizeController::class, 'show'])->name('sizes.show');
    Route::get('/size/{id}/edit', [UpdateSizeController::class, 'edit'])->name('size.edit');
    Route::put('/size/{id}', [UpdateSizeController::class, 'update'])->name('size.update');
    Route::put('/size/{id}/image', [UpdateSizeController::class, 'updateImage'])->name('size.updateImage');



    Route::get('/banner/create', [CreateBannerController::class, 'create'])->name('banner.create');
    Route::post('/banner/store', [CreateBannerController::class, 'store'])->name('banner.store');
    Route::get('/banners', [ShowBannerController::class, 'show'])->name('banners.show');
    Route::get('/banner/{id}/edit', [UpdateBannerController::class, 'edit'])->name('banner.edit');
    Route::put('/banner/{id}', [UpdateBannerController::class, 'update'])->name('banner.update');
    Route::put('/banner/{id}/image_logo_light', [UpdateBannerController::class, 'updateImageLogoLight'])->name('banner.updateImageLogoLight');
    Route::put('/banner/{id}/image_logo_dark', [UpdateBannerController::class, 'updateImageLogoDark'])->name('banner.updateImageLogoDark');
    Route::put('/banner/{id}/image_mobile', [UpdateBannerController::class, 'updateImageMobile'])->name('banner.updateImageMobile');
    Route::put('/banner/{id}/image_lablet', [UpdateBannerController::class, 'updateImageTablet'])->name('banner.updateImageTablet');
    Route::put('/banner/{id}/image_laptop', [UpdateBannerController::class, 'updateImageLaptop'])->name('banner.updateImageLaptop');
    Route::put('/banner/{id}/image_desktop', [UpdateBannerController::class, 'updateImageDesktop'])->name('banner.updateImageDesktop');
});

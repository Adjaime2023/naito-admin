<?php

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;
use App\Http\Controllers\Api\CategoryApiController;
use App\Http\Controllers\Api\SubcategoryApiController;
use App\Http\Controllers\Api\GroupApiController;
use App\Http\Controllers\Api\SubGroupApiController;
use App\Http\Controllers\Api\ColorApiController;
use App\Http\Controllers\Api\BrandApiController;
use App\Http\Controllers\Api\CollectionApiController;
use App\Http\Controllers\Api\SupplierApiController;
use App\Http\Controllers\Api\ProductApiController;
use App\Http\Controllers\Api\PartnerApiController;
use App\Http\Controllers\Api\CustomerApiController;
use App\Http\Controllers\Api\EmployeeApiController;
use App\Http\Controllers\Api\CompanyApiController;
use App\Http\Controllers\Api\BannerApiController;
use App\Http\Controllers\Api\SizeApiController;

use App\Http\Controllers\Site\Api\SlideBannerApiController;
use App\Http\Controllers\Site\Api\SiteBannerApiController;
use App\Http\Controllers\Site\Api\LaunchProductApiController;
use App\Http\Controllers\Site\Api\PromotionProductApiController;
use App\Http\Controllers\Site\Api\SitePartnerApiController;
use App\Http\Controllers\Site\Api\SiteCategoryApiController;
use App\Http\Controllers\Site\Api\SiteSubcategoriesApiController;
use App\Http\Controllers\Site\Api\SiteGroupApiController;





    Route::get('/nfe-entrada', [NfeEntradaApiController::class, 'index']);
    Route::get('/nfe-entrada/{id}', [NfeEntradaApiController::class, 'show']);
    Route::patch('/nfe-entrada/{id}/discontinued', [NfeEntradaApiController::class, 'updateDiscontinued']);
    Route::patch('/nfe-entrada/{id}/deleted', [NfeEntradaApiController::class, 'updateDeleted']);



Route::prefix('website')->group(function () {
     Route::get('siteGroups', [SiteGroupApiController::class, 'siteGroup']);
 
    Route::get('category/{categoryId}', [SiteSubcategoriesApiController::class, 'apiSubcategories']);
    Route::get('siteSlide', [SlideBannerApiController::class, 'slide']);
    Route::get('siteBanner', [SiteBannerApiController::class, 'siteBanner']);
    Route::get('siteLaunch', [LaunchProductApiController::class, 'launch']);
    Route::get('sitePromotion', [PromotionProductApiController::class, 'promotion']);
    Route::get('sitePartner', [SitePartnerApiController::class, 'sitePartner']);
    Route::get('siteCategory', [SiteCategoryApiController::class, 'siteCategory']);
});

Route::prefix('banners')->group(function () {
    Route::get('/', [BannerApiController::class, 'index']);
    Route::get('/{bannerId}', [BannerApiController::class, 'show']);
    Route::patch('/{bannerId}/discontinued', [BannerApiController::class, 'updateDiscontinued']);
    Route::patch('/{bannerId}/banner', [BannerApiController::class, 'updateBanner']);
    Route::patch('/{bannerId}/slide', [BannerApiController::class, 'updateSlide']);
    Route::patch('/{bannerId}/deleted', [BannerApiController::class, 'updateDeleted']);
});


Route::get('/company/showCompany', [CompanyApiController::class, 'showCompany']);


Route::get('/categories', [CategoryApiController::class, 'index']);
Route::get('/subcategories', [SubcategoryApiController::class, 'index']);
Route::get('/groups', [GroupApiController::class, 'index']);
Route::get('/subgroups', [SubGroupApiController::class, 'index']);
Route::get('/collors', [ColorApiController::class, 'index']);
Route::get('/collections', [CollectionApiController::class, 'index']);
Route::get('/sizes', [SizeApiController::class, 'index']);

Route::prefix('products')->group(function () {
    Route::get('/', [ProductApiController::class, 'index']);
    Route::get('/{productId}', [ProductApiController::class, 'show']);
    Route::patch('/{productId}/discontinued', [ProductApiController::class, 'updateDiscontinued']);
    Route::patch('/{productId}/promotion', [ProductApiController::class, 'updatePromotion']);
    Route::patch('/{productId}/launch', [ProductApiController::class, 'updateLaunch']);
    Route::patch('/{productId}/deleted', [ProductApiController::class, 'updateDeleted']);

});


Route::get('/product-options', [App\Http\Controllers\Api\ProductOptionsController::class, 'index']);

Route::prefix('brands')->group(function () {
    Route::get('/', [BrandApiController::class, 'index']);
    Route::get('/{brandId}', [BrandApiController::class, 'show']);
    Route::patch('/{brandId}/discontinued', [BrandApiController::class, 'updateDiscontinued']);
    Route::patch('/{brandId}/deleted', [BrandApiController::class, 'updateDeleted']);
});

Route::prefix('colors')->group(function () {
    Route::get('/', [ColorApiController::class, 'index']);
    Route::get('/{colorId}', [ColorApiController::class, 'show']);
    Route::patch('/{colorId}/discontinued', [ColorApiController::class, 'updateDiscontinued']);
    Route::patch('/{collorId}/deleted', [ColorApiController::class, 'updateDeleted']);
});

Route::prefix('sizes')->group(function () {
    Route::get('/', [SizeApiController::class, 'index']);
    Route::get('/{sizeId}', [SizeApiController::class, 'show']);
    Route::patch('/{sizeId}/discontinued', [SizeApiController::class, 'updateDiscontinued']);
    Route::patch('/{sizeId/deleted', [ColorApiController::class, 'updateDeleted']);
});


Route::prefix('collections')->group(function () {
    Route::get('/', [CollectionApiController::class, 'index']);
    Route::get('/{collectionId}', [CollectionApiController::class, 'show']);
    Route::patch('/{collectionId}/discontinued', [CollectionApiController::class, 'updateDiscontinued']);
    Route::patch('/{collectionId}/deleted', [CollectionApiController::class, 'updateDeleted']);
});

Route::prefix('subgroups')->group(function () {
    Route::get('/', [SubgroupApiController::class, 'index']);
    Route::get('/{subgroupId}', [SubgroupApiController::class, 'show']);
    Route::patch('/{subgroupId}/discontinued', [SubgroupApiController::class, 'updateDiscontinued']);
    Route::patch('/{subgroupId}/deleted', [SubgroupApiController::class, 'updateDeleted']);
});
Route::prefix('groups')->group(function () {
    Route::get('/', [GroupApiController::class, 'index']);
    Route::get('/{groupId}', [GroupApiController::class, 'show']);
    Route::patch('/{groupId}/discontinued', [GroupApiController::class, 'updateDiscontinued']);
    Route::patch('/{groupId}/deleted', [GroupApiController::class, 'updateDeleted']);
});
Route::prefix('categories')->group(function () {
    Route::get('/', [CategoryApiController::class, 'index']);
    Route::get('/{categoryId}', [CategoryApiController::class, 'show']);
    Route::patch('/{categoryId}/discontinued', [CategoryApiController::class, 'updateDiscontinued']);
    Route::patch('/{categoryId}/deleted', [CategoryApiController::class, 'updateDeleted']);
});
Route::prefix('subcategories')->group(function () {
    Route::get('/', [SubcategoryApiController::class, 'index']);
    Route::get('/{subcategoryId}', [SubcategoryApiController::class, 'show']);
    Route::patch('/{subcategoryId}/discontinued', [SubcategoryApiController::class, 'updateDiscontinued']);
    Route::patch('/{subcategoryId}/deleted', [SubcategoryApiController::class, 'updateDeleted']);
});

Route::prefix('suppliers')->group(function () {
    Route::get('/', [SupplierApiController::class, 'index']);
    Route::get('/{supplierId}', [SupplierApiController::class, 'show']);
    Route::patch('/{supplierId}/discontinued', [SupplierApiController::class, 'updateDiscontinued']);
    Route::patch('/{supplierId}/deleted', [SupplierApiController::class, 'updateDeleted']);


});


Route::prefix('customers')->group(function () {
    Route::get('/', [CustomerApiController::class, 'index']);
    Route::get('/{customerId}', [CustomerApiController::class, 'show']);
    Route::patch('/{customerId}/discontinued', [CustomerApiController::class, 'updateDiscontinued']);
    Route::patch('/{customerId}/deleted', [CustomerApiController::class, 'updateDeleted']);

});

Route::prefix('employees')->group(function () {
    Route::get('/', [EmployeeApiController::class, 'index']);
    Route::get('/{employeeId}', [EmployeeApiController::class, 'show']);
    Route::patch('/{employeeId}/discontinued', [EmployeeApiController::class, 'updateDiscontinued']);
    Route::patch('/{employeeId}/deleted', [EmployeeApiController::class, 'updateDeleted']);

});

Route::prefix('partners')->group(function () {
    Route::get('/', [PartnerApiController::class, 'index']);
    Route::get('/{partnerId}', [PartnerApiController::class, 'show']);
    Route::patch('/{partnerId}/discontinued', [PartnerApiController::class, 'updateDiscontinued']);
    Route::patch('/{partnerId}/deleted', [PartnerApiController::class, 'updateDeleted']);

});


Route::get('/user', function (Request $request) {
    return $request->user();
})->middleware('auth:sanctum');


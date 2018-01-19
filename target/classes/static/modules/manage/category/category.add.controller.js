/**
 * Created by guxiang  .
 */
app.controller("addCategoryCtrl",function($uibModalInstance,$scope){
    $scope.confirmAddCategory = function(category){
        $uibModalInstance.close(category);
    };
    $scope.cancelAddCategory= function() {
        $uibModalInstance.dismiss('cancel');
    }
})
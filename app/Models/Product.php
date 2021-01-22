<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Relations\HasMany;

class Product extends Model
{
    use HasFactory;

    protected $table = 'products';

    /**
     * @return \Illuminate\Database\Eloquent\Relations\BelongsTo
     */
    public function images(): HasMany
    {
        return $this->hasMany(ProductImage::class, 'product_id');
    }

    public function image()
    {
        return ProductImage::where('product_id',$this->id)->first();
    }

    public function recenzii(): HasMany
    {
        return $this->hasMany(Recenzii::class, 'product_id')->orderBy('created_at','desc');
    }
}

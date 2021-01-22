<?php

namespace App\Http\Controllers;

use Exception;
use Illuminate\Http\Request;
use Illuminate\Routing\Controller;
use Illuminate\Support\Facades\Storage;
use League\Glide\Server;

class GlideController extends Controller
{
    /**
     * @param $path
     * @param Server $server
     * @param Request $request
     * @return mixed
     */
    public function index($path, Server $server, Request $request)
    {
        try {
            return $server->getImageResponse($path, $request->all());
        } catch (Exception $e) {
            return $server->getImageResponse("missing_picture.jpg", $request->all());
        }
    }
}

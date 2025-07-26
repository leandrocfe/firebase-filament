<?php

namespace App\Filament\Pages;

use Filament\Schemas\Components\Component;

class Login extends \Filament\Auth\Pages\Login
{
    protected function getEmailFormComponent(): Component
    {
        return parent::getEmailFormComponent()
            ->default('test@example.com');
    }

    protected function getPasswordFormComponent(): Component
    {
        return parent::getPasswordFormComponent()
            ->default('password');
    }
}

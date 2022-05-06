<div>
    <nav x-data="{ open: false }" class="bg-white border-b border-gray-100">
        <!-- Primary Navigation Menu -->
        <div class="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8">
            <div class="flex justify-between h-16">
                <div class="flex">
                    <!-- Logo -->
                    <div class="flex-shrink-0 flex items-center">
                        <a href="{{ route('inicio') }}">
                            <x-jet-application-mark class="block h-9 w-auto" />
                        </a>
                    </div>

                    <!-- Navigation Links -->
                    
                
                </div>

                <div class="flex justify-center">
                    @foreach ($categorias as $nav_link)
                    <div class="hidden space-x-8 sm:-my-px sm:ml-10 sm:flex">
                        <x-jet-nav-link href="{{ route('categoria', $nav_link->id) }}">
                            {{ $nav_link->nombre }}
                        </x-jet-nav-link>
                    </div>
                    @endforeach
                </div>

                <div class="hidden sm:flex sm:items-center sm:ml-6">
                    <!-- Teams Dropdown -->

                    <!-- Settings Dropdown -->
                    <div class="ml-3 relative">
                        <x-jet-nav-link href="{{ route('login') }}" :active="request()->routeIs('login')">
                            Iniciar Sesión
                        </x-jet-nav-link>
                        
                        @if (Route::has('register'))
                            {{-- <a href="{{ route('register') }}" class="ml-4 text-sm text-gray-700 dark:text-gray-500 underline">Register</a> --}}
                            <x-jet-nav-link href="{{ route('register') }}" :active="request()->routeIs('register')">
                                Registrarse
                            </x-jet-nav-link>
                        @endif
                    </div>
                </div>

                <!-- Hamburger -->
                <div class="-mr-2 flex items-center sm:hidden">
                    <button @click="open = ! open" class="inline-flex items-center justify-center p-2 rounded-md text-gray-400 hover:text-gray-500 hover:bg-gray-100 focus:outline-none focus:bg-gray-100 focus:text-gray-500 transition">
                        <svg class="h-6 w-6" stroke="currentColor" fill="none" viewBox="0 0 24 24">
                            <path :class="{'hidden': open, 'inline-flex': ! open }" class="inline-flex" stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M4 6h16M4 12h16M4 18h16" />
                            <path :class="{'hidden': ! open, 'inline-flex': open }" class="hidden" stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M6 18L18 6M6 6l12 12" />
                        </svg>
                    </button>
                </div>
            </div>
        </div>

        <!-- Responsive Navigation Menu -->
        <div :class="{'block': open, 'hidden': ! open}" class="hidden sm:hidden">
            
            
            <div class="pt-2 pb-3 space-y-1">
                @foreach ($categorias as $nav_link)
                    <x-jet-responsive-nav-link href="{{ route('categoria', $nav_link->id) }}">
                        {{ $nav_link->nombre }}
                    </x-jet-responsive-nav-link>
                @endforeach
            </div>
            

            <!-- Responsive Settings Options -->
            <div class="pt-4 pb-1 border-t border-gray-200">
                                    
                <div class="py-1 border-t border-gray-200">
                    <x-jet-responsive-nav-link href="{{ route('login')}}" :active="request()->routeIs('login')">
                        Iniciar sesión
                    </x-jet-responsive-nav-link>
        
                    <x-jet-responsive-nav-link href="{{ route('register') }}" :active="request()->routeIs('register')">
                        Registrarse
                    </x-jet-responsive-nav-link>
                </div>
            </div>
        </div>
    </nav>
</div>

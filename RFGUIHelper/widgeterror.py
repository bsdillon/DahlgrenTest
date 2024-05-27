
class WidgetError(Exception):
    def __init__(self, *args, **kwargs):
        '''
        Custom error for Widgets to avoid catching all errors from widget editing.
        '''
        super().__init__(*args)
        self.custom_kwarg = kwargs.get('custom_kwarg')